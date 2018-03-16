defmodule CoinMarketCap.Repo.Migrations.CreateExchangesCoins do
  use Ecto.Migration

  def change do
    create table(:exchangers_coins) do
      add :exchanger_id, references(:exchangers, on_delete: :delete_all)
      add :coin_id, references(:coins, on_delete: :delete_all)
    end

    create unique_index(:exchangers_coins, [:exchanger_id, :coin_id])
  end
end
