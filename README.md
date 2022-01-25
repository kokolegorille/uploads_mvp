# UploadsMvp

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Description

MVP to test large uploads with https://

Problem uploading large file, browser seems to hang.

To reproduce the problem, You need
* ssl
* normal controller
* form with file input

waffle is optional, and is not the root of the problem.

## Https

References: https://hexdocs.pm/phoenix/using_ssl.html

```
mix phx.gen.cert
```

* configure for dev

```
  https: [
    port: 4001,
    cipher_suite: :strong,
    certfile: "priv/cert/selfsigned.pem",
    keyfile: "priv/cert/selfsigned_key.pem"
  ],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
```

## Configure size limits

In the endpoint

    # parsers: [:urlencoded, :multipart, :json],
    parsers: [
      :urlencoded,
      { :multipart, length: 100_000_000_000 },
      :json
    ],

In dev.exs

```
  # Configure https: https://hexdocs.pm/phoenix/using_ssl.html
  https: [
    # ip: {127, 0, 0, 1},
    port: 4001,
    protocol_options: [
      idle_timeout: 6_000_000
    ],
    cipher_suite: :strong,
    certfile: "priv/cert/selfsigned.pem",
    keyfile: "priv/cert/selfsigned_key.pem",
    otp_app: :uploads_mvp
  ],
  # force_ssl: [rewrite_on: [:x_forwarded_proto]],
  force_ssl: [hsts: true],
```

Cela marche en http.

## waffle, waffle_ecto, file_info

```
      {:waffle, "~> 1.1"},
      {:waffle_ecto, "~> 0.0.11"},
      {:file_info, "~> 0.0.4"},
```

## Test

http://localhost:4000/events/new

https://localhost:4001/events/new

http should be working, but not https
