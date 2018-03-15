defmodule CoinMarketCap.Factory do
  use ExMachina.Ecto, repo: CoinMarketCap.Repo

  use CoinMarkatCap.Factory.Exchanger
end