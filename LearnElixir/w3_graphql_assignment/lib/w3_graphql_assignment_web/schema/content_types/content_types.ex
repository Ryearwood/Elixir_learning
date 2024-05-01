defmodule W3GraphqlAssignmentWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  @desc "A User Profile with Basic Information"
  object :user do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:preferences, :CommunicationPreferences)
  end

  @desc "User-Specific Communication Preferences"
  object :CommunicationPreferences do
    field(:likesEmails, :boolean)
    field(:likesPhoneCalls, :boolean)
    field(:likesFaxes, :boolean)
  end
end
