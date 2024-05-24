defmodule W3GraphqlAssignmentWeb.Mutations.CreateUser do

  use Absinthe.Schema
  alias W3GraphqlAssignmentWeb.Resolvers.MutationResolvers

  # TODO Figure out creation mutation input types

  @desc "Preferences Types"
  input_object :preference_options do
    field(:likes_emails, non_null(:boolean))
    field(:likes_phone_calls, non_null(:boolean))
    field(:likes_faxes, non_null(:boolean))
  end

  object :create_user do
    field :create_user, :user do
      arg :id, non_null(:id)
      arg :name, non_null(:string)
      arg :email, non_null(:string)
      arg :preferences, :preference_options
      resolve &UserResolvers.create_user/2
    end
  end
end
