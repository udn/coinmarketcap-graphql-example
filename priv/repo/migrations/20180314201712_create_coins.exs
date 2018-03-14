defmodule CoinMarketCap.Repo.Migrations.CreateCoins do
  use Ecto.Migration

  def change do
    create table(:coins) do
      add :name, :string
      add :symbol, :string
      add :price, :float
      add :market_cap, :float
      add :volume, :float
      add :supply, :float
      add :change, :float

      timestamps()
    end

  end
end
