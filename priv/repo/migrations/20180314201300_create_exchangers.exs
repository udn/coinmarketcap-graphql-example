defmodule CoinMarketCap.Repo.Migrations.CreateExchangers do
  use Ecto.Migration

  def change do
    create table(:exchangers) do
      add :name, :string
      add :url, :string
      add :total_volume, :float

      timestamps()
    end

  end
end
