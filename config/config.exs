# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :coin_market_cap, ecto_repos: [CoinMarketCap.Repo]

# Configures the endpoint
config :coin_market_cap, CoinMarketCapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RIgJSNGKUkBb3OJ6R5+u9QUg6CP+42YcQUfSxlnEU4OkCLM2YO4KQSWeY9u/cxyT",
  render_errors: [view: CoinMarketCapWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CoinMarketCap.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
