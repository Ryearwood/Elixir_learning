# W3GraphqlAssignment

## Instructions

Create a GraphQL API that uses the following static list of users and has queries, mutations and subscriptions for the examples below:

```
@users [%{
  id: 1,
  name: "Bill",
  email: "bill@gmail.com",
  preferences: %{
    likes_emails: false,
    likes_phone_calls: true,
    likes_faxes: true
  }
}, %{
  id: 2,
  name: "Alice",
  email: "alice@gmail.com",
  preferences: %{
    likes_emails: true,
    likes_phone_calls: false,
    likes_faxes: true
  }
}, %{
  id: 3,
  name: "Jill",
  email: "jill@hotmail.com",
  preferences: %{
    likes_emails: true,
    likes_phone_calls: true,
    likes_faxes: false
  }
}, %{
  id: 4,
  name: "Tim",
  email: "tim@gmail.com",
  preferences: %{
    likes_emails: false,
    likes_phone_calls: false,
    likes_faxes: false
  }
}]
```

User Query <br>

```
query {
  user(id: 1) {
    id
    name
    email

    preferences {
      likesEmails
      likesPhoneCalls
      likesFaxes
    }
  }
}
```

Users Query -- None of these parameters should be required (no NON_NULL) <br>

```
query {
  users(likesEmails: true, likesPhoneCalls: false, likesFaxes: false) {
    id
    name
    email

    preferences {
      likesEmails
      likesPhoneCalls
      likesFaxes
    }
  }
}
```

Create User Mutation <br>
In the case of creating it's ok to use one mutation since we don't know if it will fail to create a user or not and would cause 2 mutations otherwise. Additionally it's important to note this shouldn't actually "save" and persist, we can return just the parameters passed in as an example of how to use GraphQL. Next level, we will cover using persistence with Ecto and Postgres.

```
mutation {
  createUser(id: 1, name: "test", email: "new email", preferences: {
    likesEmails: true,
    likesPhoneCalls: false,
    likesFaxes: true
  }) {
    id
    name
    email

    preferences {
      likesEmails
      likesPhoneCalls
      likesFaxes
    }
  }
}
```

Update User Mutation <br>
Much like above, this won't actually persist the update, instead it should just return as if it was persisting

```
mutation {
  updateUser(id: 1, name: "test", email: "new email") {
    id
    name
    email

    preferences {
      likesEmails
      likesPhoneCalls
      likesFaxes
    }
  }
}
```

Update User Preferences Mutation <br>
Only one of these preferences should be required to update

```
mutation {
  updateUserPreferences(
    userId: 1,
    likesEmails: true,
    likesPhoneCalls: false,
    likesFaxes: true
  ) {
    likesEmails
    likesPhoneCalls
    likesFaxes
  }
}
```

Create User Subscription Mutation <br>

```
subscription {
  createdUser {
    id
    name
    email

    preferences {
      likesEmails
      likesPhoneCalls
      likesFaxes
    }
  }
}
```

Update User Preferences Subscription <br>
Hint: Because the `user_id` isn't present in the subscription trigger, you'll have to add it manually to the return of the `updateUserPreferences` mutation so that you can fetch the `user_id` inside the subscription trigger

```
subscription {
  updatedUserPreferences(userId: 1) {
    likesEmails
    likesPhoneCalls
    likesFaxes
  }
}
```

## Getting Started with Phoenix

To start your Phoenix server:

- Run `mix phx.new {YOUR_PROJECT_PATH} --no-assets --no-live --no-dashboard --no-live
--no-html --no-mailer --no-ecto --app {YOUR_APP_NAME}`
- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
