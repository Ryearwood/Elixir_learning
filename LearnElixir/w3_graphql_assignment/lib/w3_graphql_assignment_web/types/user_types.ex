defmodule W3GraphqlAssignmentWeb.Types.UserTypes do
  @moduledoc """
  Root for Absinthe-GraphQL User Types
  """
  use Absinthe.Schema.Notation

  @desc "User Info"
  object :user do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:preferences, :preferences)
  end

  @desc "User Preferences"
  object :preferences do
    field(:likes_emails, :boolean)
    field(:likes_phone_calls, :boolean)
    field(:likes_faxes, :boolean)
  end

  # @desc "Preferences Types"
  # input_object :preference_options do
  #   field(:likes_emails, :boolean)
  #   field(:likes_phone_calls, :boolean)
  #   field(:likes_faxes, :boolean)
  # end

end
