defmodule CoinMarketCapWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias Absinthe.Relay.Connection

  alias CoinMarketCap.Assets.Coin
  alias CoinMarketCap.Repo

  import_types __MODULE__.AssetTypes

  query do
    connection field :all_coins, node_type: :coin do
      resolve fn args, _ -> Connection.from_query(Coin, &Repo.all/1, args) end
    end
  end
end
