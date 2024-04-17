defmodule TakeANumber do
  def start(), do: spawn(fn -> loop(0) end)

  defp loop(state) do
    # Acts in same manner as Case
    receive do
      # Initial State Instance
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      # Consequent State Instances
      {:take_a_number, sender_pid} ->
        new_state = state + 1
        send(sender_pid, new_state)
        loop(new_state)

      :stop ->
        nil

      # Skips instance if unknown message received
      _ ->
        loop(state)
    end
  end
end
