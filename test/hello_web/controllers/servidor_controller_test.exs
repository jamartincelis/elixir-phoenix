defmodule HelloWeb.ServidorControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Servidores

  @create_attrs %{cliente: "some cliente", descripcion: "some descripcion", ip: "some ip", puerto: "some puerto", servicio: "some servicio", servidor: "some servidor", status: "some status"}
  @update_attrs %{cliente: "some updated cliente", descripcion: "some updated descripcion", ip: "some updated ip", puerto: "some updated puerto", servicio: "some updated servicio", servidor: "some updated servidor", status: "some updated status"}
  @invalid_attrs %{cliente: nil, descripcion: nil, ip: nil, puerto: nil, servicio: nil, servidor: nil, status: nil}

  def fixture(:servidor) do
    {:ok, servidor} = Servidores.create_servidor(@create_attrs)
    servidor
  end

  describe "index" do
    test "lists all servidores", %{conn: conn} do
      conn = get conn, servidor_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Servidores"
    end
  end

  describe "new servidor" do
    test "renders form", %{conn: conn} do
      conn = get conn, servidor_path(conn, :new)
      assert html_response(conn, 200) =~ "New Servidor"
    end
  end

  describe "create servidor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, servidor_path(conn, :create), servidor: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == servidor_path(conn, :show, id)

      conn = get conn, servidor_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Servidor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, servidor_path(conn, :create), servidor: @invalid_attrs
      assert html_response(conn, 200) =~ "New Servidor"
    end
  end

  describe "edit servidor" do
    setup [:create_servidor]

    test "renders form for editing chosen servidor", %{conn: conn, servidor: servidor} do
      conn = get conn, servidor_path(conn, :edit, servidor)
      assert html_response(conn, 200) =~ "Edit Servidor"
    end
  end

  describe "update servidor" do
    setup [:create_servidor]

    test "redirects when data is valid", %{conn: conn, servidor: servidor} do
      conn = put conn, servidor_path(conn, :update, servidor), servidor: @update_attrs
      assert redirected_to(conn) == servidor_path(conn, :show, servidor)

      conn = get conn, servidor_path(conn, :show, servidor)
      assert html_response(conn, 200) =~ "some updated cliente"
    end

    test "renders errors when data is invalid", %{conn: conn, servidor: servidor} do
      conn = put conn, servidor_path(conn, :update, servidor), servidor: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Servidor"
    end
  end

  describe "delete servidor" do
    setup [:create_servidor]

    test "deletes chosen servidor", %{conn: conn, servidor: servidor} do
      conn = delete conn, servidor_path(conn, :delete, servidor)
      assert redirected_to(conn) == servidor_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, servidor_path(conn, :show, servidor)
      end
    end
  end

  defp create_servidor(_) do
    servidor = fixture(:servidor)
    {:ok, servidor: servidor}
  end
end
