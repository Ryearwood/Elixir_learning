defmodule W3GraphqlAssignmentWeb.Subscriptions.UpdatedUserPreferences do
  @moduledoc """
  Root for Absinthe-GraphQL updatedUserPreferences Subscription
  """
  use Absinthe.Schema.Notation

  object :updated_user_preferences_subscription do
    field :updated_user_preferences, :preferences do
      arg :user_id, non_null(:id)

      config fn %{user_id: id}, _resolution ->
        {:ok, topic: "user_preferences_updated: #{id}"}
      end

      trigger :update_user_preferences, topic: fn preferences ->
        "user_preferences_updated: #{preferences[:user_id]}" end
    end
  end
end
