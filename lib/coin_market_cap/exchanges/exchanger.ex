defmodule CoinMarketCap.Exchanges.Exchanger do
  use Ecto.Schema
  import Ecto.Changeset
  alias CoinMarketCap.Assets.Coin

  schema "exchanger" do
    field :name, :string
    field :total_volume, :float
    field :url, :string

    many_to_many :coins, Coin, join_through: "exchanges_coins"

    timestamps()
  end

  @doc false
  def changeset(exchanger, attrs) do
    exchanger
    |> cast(attrs, [:name, :url, :total_volume])
    |> validate_required([:name, :url, :total_volume])
  end
end
