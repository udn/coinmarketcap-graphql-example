defmodule CoinMarketCapWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias CoinMarketCapWeb.Resolvers

  object :analytics_review do
    @desc "Analytics content"
    field :content, non_null(:string)

    @desc "Analytics title"
    field :title, non_null(:string)

    @desc "Coin"
    field :coin, non_null(:coin)
  end

  object :create_analytics_review_payload do
    field :analytics_review, non_null(:analytics_review)
  end

  object :content_mutations do
    field :create_analytics_review, :create_analytics_review_payload do
      arg :title, non_null(:string)
      arg :content, non_null(:string)
      arg :coin, non_null(:id)

      resolve parsing_node_ids(&Resolvers.Content.create_analytics_review/2, coin: :coin)
    end
  end

  object :content_subscriptions do
    field :analytics_review_added, :analytics_review do
      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config fn _args, _info ->
        {:ok, topic: "*"}
      end

      trigger :create_analytics_review

      # this function is often not actually necessary, as the default resolver
      # for subscription functions will just do what we're doing here.
      # The point is, subscription resolvers receive whatever value triggers
      # the subscription, in our case a comment.
      resolve fn review, _, _ ->
        {:ok, review}
      end
    end
  end
end
