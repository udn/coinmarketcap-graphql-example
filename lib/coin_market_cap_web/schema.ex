defmodule CoinMarketCapWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types __MODULE__.AssetTypes
  import_types __MODULE__.ContentTypes
  import_types __MODULE__.ExchangerTypes

  alias CoinMarketCap.Assets
  alias CoinMarketCap.Assets.Coin
  alias CoinMarketCap.Content.AnalyticsReview
  alias CoinMarketCap.Exchangers.Exchanger

  # This will create an interface, :node that expects one field, :id,
  # be defined — and that the ID will be a global identifier.
  node interface do
    resolve_type fn
      %Coin{}, _ ->
        :coin

      %AnalyticsReview{}, _ ->
        :analytics_review

      %Exchanger{}, _ ->
        :exchanger

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

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Assets, Assets.data())

    # Foo source could be a Redis source
    # |> Dataloader.add_source(Foo, Foo.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
