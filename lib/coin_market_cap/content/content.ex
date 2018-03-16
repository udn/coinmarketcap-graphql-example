defmodule CoinMarketCap.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias CoinMarketCap.Repo

  alias CoinMarketCap.Content.AnalyticsReview

  @doc """
  Returns the list of analytics_reviews.

  ## Examples

      iex> list_analytics_reviews()
      [%AnalyticsReview{}, ...]

  """
  def list_analytics_reviews do
    Repo.all(AnalyticsReview)
  end

  @doc """
  Gets a single analytics_review.

  Raises `Ecto.NoResultsError` if the Analytics review does not exist.

  ## Examples

      iex> get_analytics_review!(123)
      %AnalyticsReview{}

      iex> get_analytics_review!(456)
      ** (Ecto.NoResultsError)

  """
  def get_analytics_review!(id), do: Repo.get!(AnalyticsReview, id)

  @doc """
  Creates a analytics_review.

  ## Examples

      iex> create_analytics_review(%{field: value})
      {:ok, %AnalyticsReview{}}

      iex> create_analytics_review(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_analytics_review(attrs \\ %{}) do
    %AnalyticsReview{}
    |> AnalyticsReview.changeset(attrs)
    |> put_assoc(:coin, attrs.coin)
    |> Repo.insert()
  end

  @doc """
  Updates a analytics_review.

  ## Examples

      iex> update_analytics_review(analytics_review, %{field: new_value})
      {:ok, %AnalyticsReview{}}

      iex> update_analytics_review(analytics_review, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_analytics_review(%AnalyticsReview{} = analytics_review, attrs) do
    analytics_review
    |> AnalyticsReview.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AnalyticsReview.

  ## Examples

      iex> delete_analytics_review(analytics_review)
      {:ok, %AnalyticsReview{}}

      iex> delete_analytics_review(analytics_review)
      {:error, %Ecto.Changeset{}}

  """
  def delete_analytics_review(%AnalyticsReview{} = analytics_review) do
    Repo.delete(analytics_review)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking analytics_review changes.

  ## Examples

      iex> change_analytics_review(analytics_review)
      %Ecto.Changeset{source: %AnalyticsReview{}}

  """
  def change_analytics_review(%AnalyticsReview{} = analytics_review) do
    AnalyticsReview.changeset(analytics_review, %{})
  end
end
