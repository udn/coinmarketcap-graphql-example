defmodule CoinMarketCap.Resolvers.ContentTest do
  use CoinMarketCap.DataCase
  import CoinMarketCap.Factory
  import Absinthe.Relay.Node

  test "create_review mutation should create an analytics_review" do
    coin = insert(:coin)
    title = "This bubble gonna blow!"
    content = "..."

    mutation = """
      mutation createReview($coin: String!, $content: String!, $title: String!) {
        createAnalyticsReview(coin: $coin, content: $content, title: $title) {
          analyticsReview {
            title
            content
            coin {
              name
            }
          }
        }
      }
    """

    variables = %{
      title: title,
      content: content,
      coin: to_global_id("Coin", coin.id)
    }

    response =
      build_conn()
      |> graphql_query(%{query: mutation, variables: variables})

    assert response === %{
             "data" => %{
               "createAnalyticsReview" => %{
                 "analyticsReview" => %{
                   "title" => title,
                   "content" => content,
                   "coin" => %{
                     "name" => coin.name
                   }
                 }
               }
             }
           }
  end
end
