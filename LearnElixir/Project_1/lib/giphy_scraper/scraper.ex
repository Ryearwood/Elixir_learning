defmodule GiphyScraper.Scraper do
  @moduledoc """
    Documentation for `Giphy_Scraper.Scraper`.
    This module is used to handle search requests to the Giphy API
    """
  alias GiphyScraper.GiphyImage

  @app :giphy_scraper
  @type giphy_image :: list(%GiphyImage{})
  @type response_data_body :: %{data: String.t, meta: String.t, pagination: String.t}
  @api_keyname "GIPHY_SCRAPER"
  @keyword_list [search_gif_endpoint: "https://api.giphy.com/v1/gifs/search"]
  @default_query_limit 25

  @doc """
  Sends the search query to the Giphy API endpoint and returns the result
  """

  @spec search(String.t, non_neg_integer()) :: list(%GiphyImage{})
  def search(query, limit \\ @default_query_limit) do
    query
    |> generate_request_url(limit)
    |> send_request_and_get_response_data()
    |> Enum.map(&parse_response_body_into_giphy_data/1)
    |> IO.inspect(label: "List of Giphy Images")
  end

  defp generate_request_url(query, limit) do
    api_key = get_api_key_from_env()
    case api_key do
      {:ok, api_key} -> "#{@keyword_list[:search_gif_endpoint]}?api_key=#{api_key}&q=#{query}&limit=#{limit}"
      {:error, error_message} -> error_message
    end
  end

  defp send_request_and_get_response_data(url) do
    case Req.get(url) do
      {:ok, %Req.Response{status: 200, body: body}} -> body["data"]
      {:ok, %Req.Response{status: 400}} -> {:error, "Bad Request - Check formatting!"}
      {:ok, %Req.Response{status: 401}} -> {:error, "Unauthorized -  Check Authentication Credentials"}
      {:ok, %Req.Response{status: 403}} -> {:error, "Forbidden - Check API Key Credentials"}
      {:ok, %Req.Response{status: 404}} -> {:error, "GIF or Sticker Not found"}
      {:ok, %Req.Response{status: 414}} -> {:error, "Search Query exceeds 50 characters, too long"}
      {:ok, %Req.Response{status: 429}} -> {:error, "Too Many Requests - Server Busy or Rate Exceeded"}
      _error -> {:error, "Unknown error."}
    end
  end

  defp parse_response_body_into_giphy_data(data) do
    %GiphyImage{
      id: data["id"],
      url: data["url"],
      username: data["user"]["username"],
      title: data["title"]
    }
  end

  @spec get_api_key_from_env :: tuple()
  defp get_api_key_from_env() do
    api_key = System.get_env(@api_keyname)
    if not (api_key === nil) do
        {:ok, api_key}
    else
        {:error, "Unable to retrieve API key."}
    end
  end
end
