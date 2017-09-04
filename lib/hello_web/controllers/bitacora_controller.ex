defmodule HelloWeb.BitacoraController do
  use HelloWeb, :controller
  alias Hello.{Repo,Cliente}

  plug :put_layout, "bitacora.html"

  def index(conn, _params) do
    render conn, "index.html"
  end

  def clientes(conn, _params) do
    #categories = Repo.all(Category) |> Enum.map(&{&1.name, &1.id})
    clientes = Repo.all(Cliente)
    #render conn, "clientes.html"
    render(conn, "clientes.html", clientes: clientes)
  end

  def servidores(conn, _params) do
    render conn, "servidores.html"
  end

  def totalSms(conn, _params) do
    render conn, "total-sms.html"
  end

  def usuarios(conn, _params) do
    render conn, "usuarios.html"
  end

  def logout(conn, _params) do
    redirect conn, to: "/index"
  end
end
