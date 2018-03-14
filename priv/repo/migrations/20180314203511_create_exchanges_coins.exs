defmodule CoinMarketCap.Repo.Migrations.CreateExchangesCoins do
  use Ecto.Migration

  def change do
    create table(:exchanges_coins) do
      add :exchanger_id, references(:exchanges)
      add :coin_id, references(:coins)
    end

    create unique_index(:exchanges_coins, [:exchanger_id, :coin_id])
  end
end
