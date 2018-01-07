# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :qna,
  ecto_repos: [Qna.Repo]

# Configures the endpoint
config :qna, QnaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rRSeBLzM3jKluTeU4y7ph5n8WlkjktRok+OyWFXQ+Fk9TIK9gbb7rRFgcCvPBLpI",
  render_errors: [view: QnaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Qna.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
