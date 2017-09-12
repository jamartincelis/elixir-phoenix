defmodule Hello.Servidores do
  @moduledoc """
  The Servidores context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Servidores.Servidor

  @doc """
  Returns the list of servidores.

  ## Examples

      iex> list_servidores()
      [%Servidor{}, ...]

  """
  def list_servidores do
    Repo.all(Servidor)
  end

  @doc """
  Gets a single servidor.

  Raises `Ecto.NoResultsError` if the Servidor does not exist.

  ## Examples

      iex> get_servidor!(123)
      %Servidor{}

      iex> get_servidor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_servidor!(id), do: Repo.get!(Servidor, id)

  @doc """
  Creates a servidor.

  ## Examples

      iex> create_servidor(%{field: value})
      {:ok, %Servidor{}}

      iex> create_servidor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_servidor(attrs \\ %{}) do
    %Servidor{}
    |> Servidor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a servidor.

  ## Examples

      iex> update_servidor(servidor, %{field: new_value})
      {:ok, %Servidor{}}

      iex> update_servidor(servidor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_servidor(%Servidor{} = servidor, attrs) do
    servidor
    |> Servidor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Servidor.

  ## Examples

      iex> delete_servidor(servidor)
      {:ok, %Servidor{}}

      iex> delete_servidor(servidor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_servidor(%Servidor{} = servidor) do
    Repo.delete(servidor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking servidor changes.

  ## Examples

      iex> change_servidor(servidor)
      %Ecto.Changeset{source: %Servidor{}}

  """
  def change_servidor(%Servidor{} = servidor) do
    Servidor.changeset(servidor, %{})
  end
end
