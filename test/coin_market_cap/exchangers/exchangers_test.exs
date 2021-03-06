defmodule CoinMarketCap.ExchangersTest do
  use CoinMarketCap.DataCase

  alias CoinMarketCap.Exchangers

  describe "exchanger" do
    alias CoinMarketCap.Exchangers.Exchanger

    @valid_attrs %{name: "some name", total_volume: 120.5, url: "some url"}
    @update_attrs %{name: "some updated name", total_volume: 456.7, url: "some updated url"}
    @invalid_attrs %{name: nil, total_volume: nil, url: nil}

    def exchanger_fixture(attrs \\ %{}) do
      {:ok, exchanger} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Exchangers.create_exchanger()

      exchanger
    end

    test "list_exchanger/0 returns all exchanger" do
      exchanger = exchanger_fixture()
      assert Exchangers.list_exchanger() == [exchanger]
    end

    test "get_exchanger!/1 returns the exchanger with given id" do
      exchanger = exchanger_fixture()
      assert Exchangers.get_exchanger!(exchanger.id) == exchanger
    end

    test "create_exchanger/1 with valid data creates a exchanger" do
      assert {:ok, %Exchanger{} = exchanger} = Exchangers.create_exchanger(@valid_attrs)
      assert exchanger.name == "some name"
      assert exchanger.total_volume == 120.5
      assert exchanger.url == "some url"
    end

    test "create_exchanger/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exchangers.create_exchanger(@invalid_attrs)
    end

    test "update_exchanger/2 with valid data updates the exchanger" do
      exchanger = exchanger_fixture()
      assert {:ok, exchanger} = Exchangers.update_exchanger(exchanger, @update_attrs)
      assert %Exchanger{} = exchanger
      assert exchanger.name == "some updated name"
      assert exchanger.total_volume == 456.7
      assert exchanger.url == "some updated url"
    end

    test "update_exchanger/2 with invalid data returns error changeset" do
      exchanger = exchanger_fixture()
      assert {:error, %Ecto.Changeset{}} = Exchangers.update_exchanger(exchanger, @invalid_attrs)
      assert exchanger == Exchangers.get_exchanger!(exchanger.id)
    end

    test "delete_exchanger/1 deletes the exchanger" do
      exchanger = exchanger_fixture()
      assert {:ok, %Exchanger{}} = Exchangers.delete_exchanger(exchanger)
      assert_raise Ecto.NoResultsError, fn -> Exchangers.get_exchanger!(exchanger.id) end
    end

    test "change_exchanger/1 returns a exchanger changeset" do
      exchanger = exchanger_fixture()
      assert %Ecto.Changeset{} = Exchangers.change_exchanger(exchanger)
    end
  end
end
