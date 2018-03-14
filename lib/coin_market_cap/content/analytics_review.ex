defmodule CoinMarketCap.Content.AnalyticsReview do
  use Ecto.Schema
  import Ecto.Changeset
  alias CoinMarketCap.Assets.Coin

  schema "analytics_reviews" do
    field :content, :string
    field :title, :string

    belongs_to(:coin, Coin)

    timestamps()
  end

  @doc false
  def changeset(analytics_review, attrs) do
    analytics_review
    |> cast(attrs, [:content, :title])
    |> validate_required([:content, :title])
  end
end
