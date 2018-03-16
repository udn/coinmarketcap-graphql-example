defmodule CoinMarketCap.GraphqlHelper do
  @moduledoc """
  Helper functions for graphql testing
  """

  use Phoenix.ConnTest
  # We need to set the default endpoint for ConnTest
  @endpoint CoinMarketCapWeb.Endpoint

  def mutation_skeleton(query) do
    %{
      "body" => %{
        "query" => %{
          "operationName" => "",
          "query" => query,
          "variables" => ""
        }
      }
    }
  end

  def graphql_query(conn, options) do
    conn
    |> post("/api/graphql", build_query(options[:query], options[:variables]))
    |> json_response(200)
  end

  def fields_to_query(fields) do
    fields
    |> Enum.map(&Atom.to_string/1)
    |> Enum.join("\n")
  end

  def model_to_result(model, fields) do
    for {key, val} <- Map.take(model, fields),
        into: %{},
        do: {Atom.to_string(key), parse_value(val)}
  end

  def build_conn do
    Phoenix.ConnTest.build_conn()
  end

  defp parse_value(%Decimal{} = value), do: Decimal.to_string(value)
  defp parse_value(value), do: value

  defp build_query(query, variables) do
    %{
      "query" => query,
      "variables" => variables
    }
  end
end
