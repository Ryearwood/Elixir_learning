defmodule W3GraphqlAssignmentWeb.Types.Users do
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
    field(:id, :user)
  end
end
