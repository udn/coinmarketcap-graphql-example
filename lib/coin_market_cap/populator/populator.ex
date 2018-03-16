defmodule CoinMarketCap.Populator do
  @moduledoc """
  This module populates DB with info from coinmarketcap.com
  """

  alias CoinMarketCap.Assets
  alias CoinMarketCap.Exchangers

  def initial_populate() do
    exchanges = Exchangers.list_exchanger()

    HTTPoison.get!("https://api.coinmarketcap.com/v1/ticker/?limit=0")
    |> Map.get(:body)
    |> Poison.decode!()
    |> Enum.map(fn coin -> adapt_coin(coin, exchanges) end)
    |> Enum.map(&Assets.create_coin/1)
  end

  def adapt_coin(coin, exchangers \\ []) do
    %{
      name: Map.get(coin, "name"),
      symbol: Map.get(coin, "symbol"),
      change: to_float(coin, "percent_change_24h"),
      market_cap: to_float(coin, "market_cap_usd"),
      price: to_float(coin, "price_usd"),
      supply: to_float(coin, "total_supply"),
      volume: to_float(coin, "24h_volume_usd"),
      exchangers: exchangers
    }
  end

  defp to_float(coin, key) do
    case Map.get(coin, key) do
      nil ->
        0

      value ->
        {float, _} = Float.parse(value)

        float
    end
  end
end
