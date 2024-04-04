defmodule GiphyScraper do
  defdelegate search(query), to:  GiphyScraper.Scraper
end
