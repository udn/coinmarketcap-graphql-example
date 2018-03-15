# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CoinMarketCap.Repo.insert!(%CoinMarketCap.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

binance = %CoinMarketCap.Exchangers.Exchanger{
  name: "Binance",
  url: "http://binance.com",
  total_volume: 684901405.0
}
CoinMarketCap.Repo.insert(binance)

poloniex = %CoinMarketCap.Exchangers.Exchanger{
  name: "Poloniex",
  url: "http://poloniex.com",
  total_volume: 519234092.0
}
CoinMarketCap.Repo.insert(poloniex)
