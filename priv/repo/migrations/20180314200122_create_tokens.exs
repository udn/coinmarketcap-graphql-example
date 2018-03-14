defmodule CoinMarketCap.Repo.Migrations.CreateTokens do
  use Ecto.Migration

  def change do
    create table(:tokens) do
      add :name, :string
      add :symbol, :string
      add :value, :float
      add :market_cap, :float

      timestamps()
    end

  end
end
