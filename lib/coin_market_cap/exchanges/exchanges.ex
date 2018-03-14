defmodule CoinMarketCap.Exchanges do
  @moduledoc """
  The Exchanges context.
  """

  import Ecto.Query, warn: false
  alias CoinMarketCap.Repo

  alias CoinMarketCap.Exchanges.Exchanger

  @doc """
  Returns the list of exchanger.

  ## Examples

      iex> list_exchanger()
      [%Exchanger{}, ...]

  """
  def list_exchanger do
    Repo.all(Exchanger)
  end

  @doc """
  Gets a single exchanger.

  Raises `Ecto.NoResultsError` if the Exchanger does not exist.

  ## Examples

      iex> get_exchanger!(123)
      %Exchanger{}

      iex> get_exchanger!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exchanger!(id), do: Repo.get!(Exchanger, id)

  @doc """
  Creates a exchanger.

  ## Examples

      iex> create_exchanger(%{field: value})
      {:ok, %Exchanger{}}

      iex> create_exchanger(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exchanger(attrs \\ %{}) do
    %Exchanger{}
    |> Exchanger.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exchanger.

  ## Examples

      iex> update_exchanger(exchanger, %{field: new_value})
      {:ok, %Exchanger{}}

      iex> update_exchanger(exchanger, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exchanger(%Exchanger{} = exchanger, attrs) do
    exchanger
    |> Exchanger.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Exchanger.

  ## Examples

      iex> delete_exchanger(exchanger)
      {:ok, %Exchanger{}}

      iex> delete_exchanger(exchanger)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exchanger(%Exchanger{} = exchanger) do
    Repo.delete(exchanger)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exchanger changes.

  ## Examples

      iex> change_exchanger(exchanger)
      %Ecto.Changeset{source: %Exchanger{}}

  """
  def change_exchanger(%Exchanger{} = exchanger) do
    Exchanger.changeset(exchanger, %{})
  end
end
