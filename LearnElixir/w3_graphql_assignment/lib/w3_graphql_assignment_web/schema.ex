defmodule W3GraphqlAssignmentWeb.Schema do
  @moduledoc """
  The Root of the Absinthe Schema Definitions
  """
  use Absinthe.Schema

  import_types W3GraphqlAssignmentWeb.Types.UserTypes
  import_types W3GraphqlAssignmentWeb.Queries.UserQuery
  import_types W3GraphqlAssignmentWeb.Queries.UsersQuery
  import_types W3GraphqlAssignmentWeb.Mutations.CreateUser
  import_types W3GraphqlAssignmentWeb.Mutations.UpdateUser
  import_types W3GraphqlAssignmentWeb.Mutations.UpdateUserPreferences
  import_types W3GraphqlAssignmentWeb.Subscriptions.CreatedUser
  import_types W3GraphqlAssignmentWeb.Subscriptions.UpdatedUserPreferences


  query do
    import_fields :user_query
    import_fields :users_query
  end

  mutation do
    import_fields :create_user
    import_fields :update_user
    import_fields :update_user_preferences
  end

  subscription do
    import_fields :created_user_subscriptions
    import_fields :updated_user_preferences_subscription
  end
end
