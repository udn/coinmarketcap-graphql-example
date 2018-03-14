defmodule CoinMarketCap.Repo.Migrations.CreateAnalyticsReviews do
  use Ecto.Migration

  def change do
    create table(:analytics_reviews) do
      add :content, :string
      add :title, :string
      add :coin_id, references(:coins, on_delete: :nothing)

      timestamps()
    end

    create index(:analytics_reviews, [:coin_id])
  end
end
