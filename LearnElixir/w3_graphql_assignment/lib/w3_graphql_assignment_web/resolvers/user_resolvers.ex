defmodule W3GraphqlAssignmentWeb.Resolvers.UserResolvers do
@moduledoc """
Root of Absinthe Resolvers for User Queries
"""
  @users [
    %{
      id: 1,
      name: "Bill",
      email: "bill@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: true,
        likes_faxes: true
      }
    },
    %{
      id: 2,
      name: "Alice",
      email: "alice@gmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: false,
        likes_faxes: true
      }
    },
    %{
      id: 3,
      name: "Jill",
      email: "jill@hotmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: true,
        likes_faxes: false
      }
    },
    %{
      id: 4,
      name: "Tim",
      email: "tim@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: false,
        likes_faxes: false
      }
    }
  ]

  # User Resolvers

  def get_user_by_id(%{id: id}, _) do
    id = String.to_integer(id)
    case Enum.find(@users, &(&1.id === id)) do
      nil -> {:error, %{message: "User Not Found", details: %{id: id}}}
      user -> {:ok, user}
    end
  end

  def get_user_list_by_preferences(args, _) do
    case filter_users(@users, args) do
      [] -> {:error, %{message: "No Matches Found in User List", details: args}}
      list_of_matching_users -> {:ok, list_of_matching_users}
    end
  end

  # Filters each user according to query preferences supplied in args
  defp filter_users(users_list, args) do
    Enum.filter(users_list, fn user ->
      Enum.all?(args, fn {field, value} ->
        match?(%{^field => ^value}, user[:preferences])
      end)
    end)
  end

  def create_new_user(args = %{id: id, name: name, email: email, preferences: %{likes_emails: likes_emails, likes_phone_calls: likes_phone_calls, likes_faxes: likes_faxes}}) do
    case Enum.concat(@users, [args]) do
      [] -> {:error, %{message: "Unable to add New User to existing list of Users", details: args}}
      list_with_new_user -> {:ok, list_with_new_user}
    end
  end

  def update_user_params(params_map, id) do
    case get_user_by_id(%{id: id,}, params_map) do
      {:error, details} -> {:error, details}
      {:ok, user} -> {:ok, Map.merge(user, Map.delete(params_map, id))}
    end
  end

  def update_user_preferences(params_map, id) do
    case get_user_by_id(%{id: id,}, params_map) do
      {:error, details} -> {:error, details}
      {:ok, user} -> {:ok, update_preferences(user, params_map)}
    end
  end

  defp update_preferences(user_map, params_map) do
    updated_preferences = Map.merge(user_map[:preferences], Map.delete(params_map, :id))
    Map.put(Map.delete(user_map, :preferences), :preferences, updated_preferences)
  end
end
