defmodule CoinMarketCap.Resolvers.AssetResolverTest do
  @moduledoc false
  use CoinMarketCap.DataCase
  import CoinMarketCap.Factory

  test "all_coins query should return connection type" do
    count = 3
    coins = insert_list(count, :coin)

    query_fields = [:name, :price]

    query = """
    {
      allCoins(first: #{count}) {
        edges {
          node{
           #{fields_to_query(query_fields)}
          }
        }
      }
    }
    """

    response =
      build_conn()
      |> graphql_query(%{query: query})

    assert response == %{
             "data" => %{
               "allCoins" => %{
                 "edges" =>
                   Enum.map(coins, fn coin -> connection_model_to_result(coin, query_fields) end)
               }
             }
           }
  end
end
