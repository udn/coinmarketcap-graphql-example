defmodule CoinMarketCapWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types __MODULE__.AssetTypes
  import_types __MODULE__.ContentTypes

  alias CoinMarketCap.Assets.Coin
  alias CoinMarketCap.Content.AnalyticsReview

  node interface do
    resolve_type fn
      %Coin{}, _ ->
        :coin

      %AnalyticsReview{}, _ ->
        :analytics_review

      _, _ ->
        nil
    end
  end

  query do
    import_fields :assets_queries
  end

  mutation do
    import_fields :content_mutations
  end

  subscription do
    import_fields :content_subscriptions
  end
end
