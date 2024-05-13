defmodule W3GraphqlAssignmentWeb.Resolvers.Users do
@moduledoc """
Root of Absinthe Resolvers for User Schema
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

  def get_user_by_id(%{id: id}, _) do
    id = String.to_integer(id)
    case Enum.find(@users, &(&1.id === id)) do
      nil -> {:error, %{message: "User Not Found", details: %{id: id}}}
      user -> {:ok, user}
    end
  end

  def get_user_list_by_preferences(args = %{likes_emails: emails, likes_phone_calls: phone_calls, likes_faxes: faxes}, _) do
    case Enum.filter(@users, &match?(^args, &1.preferences)) do
      [] -> {:error, %{message: "Not Found", details: args}}
      list_of_matching_users -> {:ok, list_of_matching_users}
    end
  end
end
