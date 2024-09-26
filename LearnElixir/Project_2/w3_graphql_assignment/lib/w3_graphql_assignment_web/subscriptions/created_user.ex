defmodule W3GraphqlAssignmentWeb.Subscriptions.CreatedUser do
  @moduledoc """
  Root for Absinthe-GraphQL createdUser Subscription
  """
  use Absinthe.Schema.Notation

  object :created_user_subscriptions do
    field :created_user, non_null(:user) do
      config fn _args, _resolution ->
        {:ok, topic: "created_user"}
      end

      trigger :create_user, topic: fn _ -> "created_user" end
    end
  end
end
