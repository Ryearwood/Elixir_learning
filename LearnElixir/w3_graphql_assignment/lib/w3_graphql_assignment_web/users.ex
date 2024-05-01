defmodule W3GraphqlAssignmentWeb.Users do
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


  
end
