defmodule CoinMarketCap.Assets.Coin do
  use Ecto.Schema
  import Ecto.Changeset
  alias CoinMarketCap.Content.AnalyticsReview
  alias CoinMarketCap.Exchangers.Exchanger

  schema "coins" do
    field :change, :float
    field :market_cap, :float
    field :name, :string
    field :price, :float
    field :supply, :float
    field :symbol, :string
    field :volume, :float

    has_many(:analytics_reviews, AnalyticsReview)
    many_to_many(:exchangers, Exchanger, join_through: "exchangers_coins")

    timestamps()
  end

  @doc false
  def changeset(coin, attrs) do
    coin
    |> cast(attrs, [:name, :symbol, :price, :market_cap, :volume, :supply, :change])
    |> validate_required([:name, :symbol, :price, :market_cap, :volume, :supply, :change])
  end
end
