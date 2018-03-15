defmodule CoinMarketCap.Repo.Migrations.CreateExchangesCoins do
  use Ecto.Migration

  def change do
    create table(:exchangers_coins) do
      add :exchanger_id, references(:exchangers)
      add :coin_id, references(:coins)
    end

    create unique_index(:exchangers_coins, [:exchanger_id, :coin_id])
  end
end
