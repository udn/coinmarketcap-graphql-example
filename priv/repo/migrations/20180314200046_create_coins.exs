defmodule CoinMarketCap.Repo.Migrations.CreateCoins do
  use Ecto.Migration

  def change do
    create table(:coins) do
      add :name, :string
      add :symbol, :string
      add :value, :float
      add :market_cap, :float

      timestamps()
    end

  end
end
