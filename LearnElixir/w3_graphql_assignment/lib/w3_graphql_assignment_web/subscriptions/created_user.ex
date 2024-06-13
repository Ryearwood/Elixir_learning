defmodule W3GraphqlAssignmentWeb.Subscriptions.CreatedUser do
  @moduledoc """
  Root for Absinthe-GraphQL createdUser Subscription
  """
  use Absinthe.Schema.Notation

  object :created_user do
    field :create_user, :user do
      arg :id, non_null(:id)
      arg :name, non_null(:string)
      arg :email, non_null(:string)
      arg :preferences, non_null(:preference_options)
      config fn args, %{context: context} -> {:ok, topic: args} end
    end
  end
end
