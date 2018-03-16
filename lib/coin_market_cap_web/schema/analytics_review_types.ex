defmodule CoinMarketCapWeb.Schema.AnalyticsReviewTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias CoinMarketCapWeb.Resolvers

  object :analytics_review do
    @desc "Analytics content"
    field :content, non_null :string

    @desc "Analytics title"
    field :title, non_null :string

    @desc "Coin"
    field :coin, non_null :coin
  end

  object :create_analytics_review_payload  do
    field :analytics_review, non_null :analytics_review
  end

  object :analytics_reviews_mutations do
    field :create_analytics_review, :create_analytics_review_payload do
      arg :title, non_null :string
      arg :content, non_null :string
      arg :coin, non_null :id

      resolve &Resolvers.AnalyticsReview.create_analytics_review/2
    end
  end
end
