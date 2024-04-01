defmodule HighScore do
  @highscore_map %{}
  @default_score 0

  def new(), do: @highscore_map

  def add_player(score_map, player_name, player_score \\ @default_score) do
    Map.put(score_map, player_name, player_score)
  end

  def remove_player(score_map, player_name) do
    Map.delete(score_map, player_name)
  end

  def reset_score(score_map, player_name) do
    Map.put(score_map, player_name, @default_score)
  end

  def update_score(score_map, player_name, player_score) do
    Map.update(score_map, player_name, player_score, fn current_score -> current_score + player_score end)
  end

  def get_players(score_map), do: Map.keys(score_map)
end
