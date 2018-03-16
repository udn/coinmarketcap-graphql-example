defmodule CoinMarkatCap.Factory.Exchanger do
  alias CoinMarketCap.Exchangers.Exchanger

  defmacro __using__(_opts) do
    quote do
      def exchanger_factory do
        %Exchanger{
          name: "Binance",
          total_volume: 58_312_349,
          url: "http://binance.com"
        }
      end
    end
  end
end
