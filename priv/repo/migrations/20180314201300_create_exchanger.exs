defmodule CoinMarketCap.Repo.Migrations.CreateExchanger do
  use Ecto.Migration

  def change do
    create table(:exchanger) do
      add :name, :string
      add :url, :string
      add :total_volume, :float

      timestamps()
    end

  end
end