defmodule CoinMarketCapWeb.Schema do
  use Absinthe.Schema

  import_types __MODULE__.AssetTypes

  query do
    field :all_coins, list_of(:coin) do
      resolve fn _, _ -> [] end
    end
  end
end
