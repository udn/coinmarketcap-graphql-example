defmodule CoinMarketCapWeb.Router do
  use CoinMarketCapWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api" do
    pipe_through(:api)

    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: CoinMarketCapWeb.Schema,
      interface: :playground,
      context: %{pubsub: CoinMarketCap.Endpoint}
    )

    forward(
      "/",
      Absinthe.Plug,
      schema: CoinMarketCapWeb.Schema,
      socket: CoinMarketCap.UserSocket
    )
  end
end
