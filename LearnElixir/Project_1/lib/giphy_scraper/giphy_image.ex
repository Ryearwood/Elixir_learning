defmodule GiphyScraper.GiphyImage do
  @type giphy_image :: %{
    id: String.t,
    url: String.t,
    username: String.t,
    title: String.t,
  }
  @enforce_keys [:id, :url, :username, :title]
  defstruct [:id, :url, :username, :title]
end
