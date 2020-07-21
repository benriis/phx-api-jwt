# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth_test,
  ecto_repos: [AuthTest.Repo]

# Configures the endpoint
config :auth_test, AuthTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QU/qd9cS5QXJMNsdu4bHlbHq+TkArVlddJK0OkdpSUQ96DXEaPFCqsKVDpgstl+a",
  render_errors: [view: AuthTestWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AuthTest.PubSub,
  live_view: [signing_salt: "x1cpC/5z"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :auth_test, AuthTest.Guardian,
      issuer: "auth_test",
      secret_key: "H+0hkTyRBvWZIyX1Zj65NqSmgePUJLO/DQJlrYwRAtAuseCEdVkWvyszDRZyIp5c"
