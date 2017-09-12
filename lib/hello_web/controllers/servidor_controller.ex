defmodule HelloWeb.ServidorController do
  use HelloWeb, :controller

  alias Hello.Servidores
  alias Hello.Servidores.Servidor

  plug :put_layout, "bitacora.html"

  def index(conn, _params) do
    servidores = Servidores.list_servidores()
    render(conn, "index.html", servidores: servidores)
  end

  def new(conn, _params) do
    changeset = Servidores.change_servidor(%Servidor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"servidor" => servidor_params}) do
    case Servidores.create_servidor(servidor_params) do
      {:ok, servidor} ->
        conn
        |> put_flash(:info, "Servidor created successfully.")
        |> redirect(to: servidor_path(conn, :show, servidor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    servidor = Servidores.get_servidor!(id)
    render(conn, "show.html", servidor: servidor)
  end

  def edit(conn, %{"id" => id}) do
    servidor = Servidores.get_servidor!(id)
    changeset = Servidores.change_servidor(servidor)
    render(conn, "edit.html", servidor: servidor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "servidor" => servidor_params}) do
    servidor = Servidores.get_servidor!(id)

    case Servidores.update_servidor(servidor, servidor_params) do
      {:ok, servidor} ->
        conn
        |> put_flash(:info, "Servidor updated successfully.")
        |> redirect(to: servidor_path(conn, :show, servidor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", servidor: servidor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    servidor = Servidores.get_servidor!(id)
    {:ok, _servidor} = Servidores.delete_servidor(servidor)

    conn
    |> put_flash(:info, "Servidor deleted successfully.")
    |> redirect(to: servidor_path(conn, :index))
  end
end
