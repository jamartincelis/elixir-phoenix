defmodule HelloWeb.LoginController do
  use HelloWeb, :controller

  plug :put_layout, "login.html"

  def login(conn, _params) do
    render conn, "login.html"
  end

end
