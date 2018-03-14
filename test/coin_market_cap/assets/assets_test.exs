defmodule CoinMarketCap.AssetsTest do
  use CoinMarketCap.DataCase

  alias CoinMarketCap.Assets

  describe "coins" do
    alias CoinMarketCap.Assets.Coin

    @valid_attrs %{change: 120.5, market_cap: 120.5, name: "some name", price: 120.5, supply: 120.5, symbol: "some symbol", volume: 120.5}
    @update_attrs %{change: 456.7, market_cap: 456.7, name: "some updated name", price: 456.7, supply: 456.7, symbol: "some updated symbol", volume: 456.7}
    @invalid_attrs %{change: nil, market_cap: nil, name: nil, price: nil, supply: nil, symbol: nil, volume: nil}

    def coin_fixture(attrs \\ %{}) do
      {:ok, coin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assets.create_coin()

      coin
    end

    test "list_coins/0 returns all coins" do
      coin = coin_fixture()
      assert Assets.list_coins() == [coin]
    end

    test "get_coin!/1 returns the coin with given id" do
      coin = coin_fixture()
      assert Assets.get_coin!(coin.id) == coin
    end

    test "create_coin/1 with valid data creates a coin" do
      assert {:ok, %Coin{} = coin} = Assets.create_coin(@valid_attrs)
      assert coin.change == 120.5
      assert coin.market_cap == 120.5
      assert coin.name == "some name"
      assert coin.price == 120.5
      assert coin.supply == 120.5
      assert coin.symbol == "some symbol"
      assert coin.volume == 120.5
    end

    test "create_coin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assets.create_coin(@invalid_attrs)
    end

    test "update_coin/2 with valid data updates the coin" do
      coin = coin_fixture()
      assert {:ok, coin} = Assets.update_coin(coin, @update_attrs)
      assert %Coin{} = coin
      assert coin.change == 456.7
      assert coin.market_cap == 456.7
      assert coin.name == "some updated name"
      assert coin.price == 456.7
      assert coin.supply == 456.7
      assert coin.symbol == "some updated symbol"
      assert coin.volume == 456.7
    end

    test "update_coin/2 with invalid data returns error changeset" do
      coin = coin_fixture()
      assert {:error, %Ecto.Changeset{}} = Assets.update_coin(coin, @invalid_attrs)
      assert coin == Assets.get_coin!(coin.id)
    end

    test "delete_coin/1 deletes the coin" do
      coin = coin_fixture()
      assert {:ok, %Coin{}} = Assets.delete_coin(coin)
      assert_raise Ecto.NoResultsError, fn -> Assets.get_coin!(coin.id) end
    end

    test "change_coin/1 returns a coin changeset" do
      coin = coin_fixture()
      assert %Ecto.Changeset{} = Assets.change_coin(coin)
    end
  end
end
