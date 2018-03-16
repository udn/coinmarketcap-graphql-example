defmodule CoinMarketCapWeb.Schema.ExchangerTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  node object(:exchanger) do
    @desc "Exchanger's name"
    field :name, non_null(:string)

    @desc "Exchanger's url"
    field :url, non_null(:string)

    @desc "Exchanger's total volume"
    field :total_volume, non_null(:float)
  end
end
