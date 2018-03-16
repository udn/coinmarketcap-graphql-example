defmodule CoinMarketCapWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types __MODULE__.AssetTypes
  import_types __MODULE__.AnalyticsReviewTypes

  query do
    import_fields :coins_queries
  end

  mutation do
    import_fields :analytics_reviews_mutations
  end
end
