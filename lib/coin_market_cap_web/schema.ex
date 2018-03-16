defmodule CoinMarketCapWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types __MODULE__.AssetTypes

  query do
    import_fields :coins_queries
  end
end
