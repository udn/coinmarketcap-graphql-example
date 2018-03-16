defmodule CoinMarketCap.ContentTest do
  use CoinMarketCap.DataCase

  alias CoinMarketCap.Content
  alias CoinMarketCap.Repo

  describe "analytics_reviews" do
    alias CoinMarketCap.Content.AnalyticsReview

    @valid_attrs %{content: "some content", title: "some title", coin: nil}
    @update_attrs %{content: "some updated content", title: "some updated title", coin: nil}
    @invalid_attrs %{content: nil, title: nil, coin: nil}

    def analytics_review_fixture(attrs \\ %{}) do
      {:ok, analytics_review} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_analytics_review()

      analytics_review
    end

    test "list_analytics_reviews/0 returns all analytics_reviews" do
      analytics_review = analytics_review_fixture()
      assert Content.list_analytics_reviews() |> Repo.preload(:coin) == [analytics_review]
    end

    test "get_analytics_review!/1 returns the analytics_review with given id" do
      analytics_review = analytics_review_fixture()
      assert Content.get_analytics_review!(analytics_review.id) |> Repo.preload(:coin) == analytics_review
    end

    test "create_analytics_review/1 with valid data creates a analytics_review" do
      assert {:ok, %AnalyticsReview{} = analytics_review} =
               Content.create_analytics_review(@valid_attrs)

      assert analytics_review.content == "some content"
      assert analytics_review.title == "some title"
    end

    test "create_analytics_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_analytics_review(@invalid_attrs)
    end

    test "update_analytics_review/2 with valid data updates the analytics_review" do
      analytics_review = analytics_review_fixture()

      assert {:ok, analytics_review} =
               Content.update_analytics_review(analytics_review, @update_attrs)

      assert %AnalyticsReview{} = analytics_review
      assert analytics_review.content == "some updated content"
      assert analytics_review.title == "some updated title"
    end

    test "update_analytics_review/2 with invalid data returns error changeset" do
      analytics_review = analytics_review_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Content.update_analytics_review(analytics_review, @invalid_attrs)

      assert analytics_review == Content.get_analytics_review!(analytics_review.id) |> Repo.preload(:coin)
    end

    test "delete_analytics_review/1 deletes the analytics_review" do
      analytics_review = analytics_review_fixture()
      assert {:ok, %AnalyticsReview{}} = Content.delete_analytics_review(analytics_review)

      assert_raise Ecto.NoResultsError, fn ->
        Content.get_analytics_review!(analytics_review.id)
      end
    end

    test "change_analytics_review/1 returns a analytics_review changeset" do
      analytics_review = analytics_review_fixture()
      assert %Ecto.Changeset{} = Content.change_analytics_review(analytics_review)
    end
  end
end
