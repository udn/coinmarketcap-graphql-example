defmodule CoinMarketCapWeb.Schema.AssetTypes do
  use Absinthe.Schema.Notation

  object :coin do
    @desc "Coin name"
    field :name, non_null(:string)

    @desc "Coin symbol"
    field :symbol, non_null(:string)

    @desc "Coin market cap"
    field :market_cap, non_null(:integer)
  end
end
