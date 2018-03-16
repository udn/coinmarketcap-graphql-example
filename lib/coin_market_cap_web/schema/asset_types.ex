defmodule CoinMarketCapWeb.Schema.AssetTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  connection(node_type: :coin)

  object :coin do
    @desc "Coin's name"
    field :name, non_null(:string)

    @desc "Coin's symbol"
    field :symbol, non_null(:string)

    @desc "Coin's price"
    field :price, non_null(:float)

    @desc "Coin's market cap"
    field :market_cap, non_null(:integer)
  end
end
