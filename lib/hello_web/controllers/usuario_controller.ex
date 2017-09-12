defmodule HelloWeb.UsuarioController do
  use HelloWeb, :controller

  alias Hello.Usuarios
  alias Hello.Usuarios.Usuario

  plug :put_layout, "bitacora.html"

  def index(conn, _params) do
    usuarios = Usuarios.list_usuarios()
    render(conn, "index.html", usuarios: usuarios)
  end

  def new(conn, _params) do
    changeset = Usuarios.change_usuario(%Usuario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"usuario" => usuario_params}) do
    case Usuarios.create_usuario(usuario_params) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Usuario created successfully.")
        |> redirect(to: usuario_path(conn, :show, usuario))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    usuario = Usuarios.get_usuario!(id)
    render(conn, "show.html", usuario: usuario)
  end

  def edit(conn, %{"id" => id}) do
    usuario = Usuarios.get_usuario!(id)
    changeset = Usuarios.change_usuario(usuario)
    render(conn, "edit.html", usuario: usuario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "usuario" => usuario_params}) do
    usuario = Usuarios.get_usuario!(id)

    case Usuarios.update_usuario(usuario, usuario_params) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Usuario updated successfully.")
        |> redirect(to: usuario_path(conn, :show, usuario))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", usuario: usuario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    usuario = Usuarios.get_usuario!(id)
    {:ok, _usuario} = Usuarios.delete_usuario(usuario)

    conn
    |> put_flash(:info, "Usuario deleted successfully.")
    |> redirect(to: usuario_path(conn, :index))
  end
end
