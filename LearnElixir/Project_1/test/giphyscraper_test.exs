defmodule GiphyScraperTest do
  use ExUnit.Case
  doctest GiphyScraper

  test "Search Giphy for Dog gifs" do
    assert GiphyScraper.search("Dog") == "https://api.giphy.com/v1/gifs/search?api_key=&q=Dog&limit=25"
  end
end
