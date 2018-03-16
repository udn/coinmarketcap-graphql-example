defmodule CoinMarkatCap.Factory.Coin do
  alias CoinMarketCap.Assets.Coin

  defmacro __using__(_opts) do
    quote do
      def coin_factory do
        %Coin{
          change: -7.31,
          market_cap: 140_212_866_472.0,
          name: sequence(:name, &"Bitcoin#{&1}"),
          price: 8286.69,
          supply: 16_920_250.0,
          symbol: sequence(:symbol, &"BTC#{&1}"),
          volume: 7.72809e9,
          exchangers: build_list(2, :exchanger)
        }
      end
    end
  end
end
