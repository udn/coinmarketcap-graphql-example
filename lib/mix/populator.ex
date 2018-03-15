defmodule Mix.Tasks.Populator.Initial do
  use Mix.Task

  @shortdoc "Populates application with info from coinmarketcap"
  def run(_) do
    Application.ensure_all_started(:coin_market_cap)
    CoinMarketCap.Populator.initial_populate()
  end

end