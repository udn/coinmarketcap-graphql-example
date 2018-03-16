defmodule CoinMarketCapWeb.Resolvers.Asset do
  @moduledoc """
  Asset resolver
  """

  alias Absinthe.Relay.Connection
  alias CoinMarketCap.Assets
  alias CoinMarketCap.Assets.Coin
  alias CoinMarketCap.Repo

  def all_coins(args, _info) do
    Connection.from_query(Coin, &Repo.all/1, args)
  end

  def coin(%{id: id}, _info) do
    {:ok, Assets.get_coin(id)}
  end
end
