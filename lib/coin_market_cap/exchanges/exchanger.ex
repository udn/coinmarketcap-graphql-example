defmodule CoinMarketCap.Exchanges.Exchanger do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exchanger" do
    field :name, :string
    field :total_volume, :float
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(exchanger, attrs) do
    exchanger
    |> cast(attrs, [:name, :url, :total_volume])
    |> validate_required([:name, :url, :total_volume])
  end
end
