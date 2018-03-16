defmodule CoinMarketCapWeb.Resolvers.Content do
  @moduledoc """
  AnalyticsReview resolver
  """

  alias CoinMarketCap.Assets
  alias CoinMarketCap.Content

  def create_analytics_review(args, _info) do
    review =
      args
      |> Map.update!(:coin, &Assets.get_coin!/1)
      |> Content.create_analytics_review()

    case review do
      {:ok, review} ->
        Absinthe.Subscription.publish(
          CoinMarketCapWeb.Endpoint,
          review,
          analytics_review_added: "*"
        )

        {:ok, %{analytics_review: review}}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
