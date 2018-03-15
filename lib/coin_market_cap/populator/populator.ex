defmodule CoinMarketCap.Populator do
  @moduledoc """
  This module populates DB with info from coinmarketcap.com
  """

  alias CoinMarketCap.Assets.Coin


  def populate() do
    coins = HTTPoison.get!("https://api.coinmarketcap.com/v1/ticker/?limit=0")
            |> Map.get(:body)
            |> Poison.decode!()
  end

  def adapt_coin(coin) do
    %Coin{
      name: Map.get(coin, "name"),
      symbol: Map.get(coin, "symbol"),
      change: Map.get(coin, "percent_change_24h")
              |> String.to_float(),
      market_cap: Map.get(coin, "market_cap_usd") |> String.to_integer(),
      price: Map.get(coin, "price_usd") |> String.to_float(),
      supply: Map.get(coin, "total_supply") |> String.to_float(),
      volume: Map.get(coin, "24h_volume_usd") |> String.to_float(),
    }
  end
end
