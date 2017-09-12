defmodule HelloWeb.UsuarioControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Usuarios

  @create_attrs %{apellido: "some apellido", nombre: "some nombre", perfil: "some perfil", status: "some status", usuario: "some usuario"}
  @update_attrs %{apellido: "some updated apellido", nombre: "some updated nombre", perfil: "some updated perfil", status: "some updated status", usuario: "some updated usuario"}
  @invalid_attrs %{apellido: nil, nombre: nil, perfil: nil, status: nil, usuario: nil}

  def fixture(:usuario) do
    {:ok, usuario} = Usuarios.create_usuario(@create_attrs)
    usuario
  end

  describe "index" do
    test "lists all usuarios", %{conn: conn} do
      conn = get conn, usuario_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Usuarios"
    end
  end

  describe "new usuario" do
    test "renders form", %{conn: conn} do
      conn = get conn, usuario_path(conn, :new)
      assert html_response(conn, 200) =~ "New Usuario"
    end
  end

  describe "create usuario" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, usuario_path(conn, :create), usuario: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == usuario_path(conn, :show, id)

      conn = get conn, usuario_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Usuario"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, usuario_path(conn, :create), usuario: @invalid_attrs
      assert html_response(conn, 200) =~ "New Usuario"
    end
  end

  describe "edit usuario" do
    setup [:create_usuario]

    test "renders form for editing chosen usuario", %{conn: conn, usuario: usuario} do
      conn = get conn, usuario_path(conn, :edit, usuario)
      assert html_response(conn, 200) =~ "Edit Usuario"
    end
  end

  describe "update usuario" do
    setup [:create_usuario]

    test "redirects when data is valid", %{conn: conn, usuario: usuario} do
      conn = put conn, usuario_path(conn, :update, usuario), usuario: @update_attrs
      assert redirected_to(conn) == usuario_path(conn, :show, usuario)

      conn = get conn, usuario_path(conn, :show, usuario)
      assert html_response(conn, 200) =~ "some updated apellido"
    end

    test "renders errors when data is invalid", %{conn: conn, usuario: usuario} do
      conn = put conn, usuario_path(conn, :update, usuario), usuario: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Usuario"
    end
  end

  describe "delete usuario" do
    setup [:create_usuario]

    test "deletes chosen usuario", %{conn: conn, usuario: usuario} do
      conn = delete conn, usuario_path(conn, :delete, usuario)
      assert redirected_to(conn) == usuario_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, usuario_path(conn, :show, usuario)
      end
    end
  end

  defp create_usuario(_) do
    usuario = fixture(:usuario)
    {:ok, usuario: usuario}
  end
end
