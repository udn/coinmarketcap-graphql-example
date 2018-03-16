defmodule CoinMarketCapWeb.Schema.AssetTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias CoinMarketCapWeb.Resolvers

  node object(:coin) do
    @desc "Coin's name"
    field :name, non_null(:string)

    @desc "Coin's symbol"
    field :symbol, non_null(:string)

    @desc "Coin's price"
    field :price, non_null(:float)

    @desc "Coin's market cap"
    field :market_cap, non_null(:integer)
  end

  connection(node_type: :coin)

  object :assets_queries do
    connection field :all_coins, node_type: :coin do
      resolve &Resolvers.Asset.all_coins/2
    end

    field :coin, :coin do
      arg :id, non_null(:id)

      resolve parsing_node_ids(&Resolvers.Asset.coin/2, id: :coin)
    end
  end
end
