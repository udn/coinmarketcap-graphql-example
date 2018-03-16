defmodule CoinMarketCapWeb.Schema.AssetTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias CoinMarketCapWeb.Resolvers
  alias CoinMarketCap.Assets

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  # Using macro 'node' we brings ID to coin object automatically
  node object(:coin) do
    @desc "Coin's name"
    field :name, non_null(:string)

    @desc "Coin's symbol"
    field :symbol, non_null(:string)

    @desc "Coin's price"
    field :price, non_null(:float)

    @desc "Coin's market cap"
    field :market_cap, non_null(:integer)

    @desc "Coin's exchangers"
    field :exchangers, :exchanger |> list_of |> non_null, resolve: dataloader(Assets)
  end

  # This will automatically define two new types: :coin_connection
  # and :coin_edge.
  connection(node_type: :coin)

  object :assets_queries do
    connection field :all_coins, node_type: :coin do
      resolve &Resolvers.Asset.all_coins/2
    end

    field :coin, :coin do
      @desc "Coin ID"
      arg :id, non_null(:id)

      # &parsing_node_ids/2 automatically converts global id to intenal id
      resolve parsing_node_ids(&Resolvers.Asset.coin/2, id: :coin)
    end
  end
end
