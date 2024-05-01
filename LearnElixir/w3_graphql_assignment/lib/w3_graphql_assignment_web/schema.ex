defmodule W3GraphqlAssignmentWeb.Schema do
  use Absinthe.Schema

  import_types(W3GraphqlAssignmentWeb.Schema.ContentTypes.ContentTypes)
  import_types(W3GraphqlAssignmentWeb.Schema.Queries.Users)
  import_types(W3GraphqlAssignmentWeb.Schema.Mutations.Users)

  query do
    @desc "Get a User Profile by ID"
    field :user, :user do
      arg(:id, non_null(:id))

      resolve(fn %{id: id}, _ ->
        id = String.to_integer(id)

        case Enum.find(@users, &(&1.id === id)) do
          nil -> {:error, %{message: "Not Found", details: %{id: id}}}
          user -> {:ok, user}
        end
      end)
    end

    @desc "Get a List of Users based on their Communication Preferences"
    field :users, list_of(:user) do
      arg(:preferences, :CommunicationPreferences)

      resolve(fn
        %{preferences: preferences}, _ ->
          case Enum.filter(@users, &match?(preferences, get_user_preferences(&1))) do
            [] -> {:error, %{message: "Not Found", details: %{preferences: preferences}}}
            list_of_users -> {:ok, list_of_users}
          end

        _, _ ->
          {:ok, @users}
      end)
    end
  end

  defp get_user_preferences(user_data), do: Map.fetch(user_data, :preferences)
end
