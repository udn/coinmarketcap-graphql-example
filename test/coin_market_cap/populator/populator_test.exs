defmodule CoinMarketCap.PopulatorTest do
  use CoinMarketCap.DataCase

  import CoinMarketCap.Factory

  alias CoinMarketCap.Populator

  test "&adapt_coin/1 should return adapted Coin structure" do
    exchanger = insert(:exchanger)
    cmc_coin = %{
      "24h_volume_usd" => "7234160000.0",
      "available_supply" => "16920125.0",
      "id" => "bitcoin",
      "last_updated" => "1521102866",
      "market_cap_usd" => "133902654426",
      "max_supply" => "21000000.0",
      "name" => "Bitcoin",
      "percent_change_1h" => "-0.53",
      "percent_change_24h" => "-13.41",
      "percent_change_7d" => "-20.19",
      "price_btc" => "1.0",
      "price_usd" => "7913.81",
      "rank" => "1",
      "symbol" => "BTC",
      "total_supply" => "16920125.0"
    }
    coin = %{
      name: "Bitcoin",
      symbol: "BTC",
      change: -13.41,
      market_cap: 133902654426.0,
      price: 7913.81,
      supply: 16920125.0,
      volume: 7234160000.0,
      exchangers: [exchanger]
    }

    result = Populator.adapt_coin(cmc_coin, [exchanger])

    assert coin === result
  end
end