defmodule Hello.ServidoresTest do
  use Hello.DataCase

  alias Hello.Servidores

  describe "servidores" do
    alias Hello.Servidores.Servidor

    @valid_attrs %{cliente: "some cliente", descripcion: "some descripcion", ip: "some ip", puerto: "some puerto", servicio: "some servicio", servidor: "some servidor", status: "some status"}
    @update_attrs %{cliente: "some updated cliente", descripcion: "some updated descripcion", ip: "some updated ip", puerto: "some updated puerto", servicio: "some updated servicio", servidor: "some updated servidor", status: "some updated status"}
    @invalid_attrs %{cliente: nil, descripcion: nil, ip: nil, puerto: nil, servicio: nil, servidor: nil, status: nil}

    def servidor_fixture(attrs \\ %{}) do
      {:ok, servidor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Servidores.create_servidor()

      servidor
    end

    test "list_servidores/0 returns all servidores" do
      servidor = servidor_fixture()
      assert Servidores.list_servidores() == [servidor]
    end

    test "get_servidor!/1 returns the servidor with given id" do
      servidor = servidor_fixture()
      assert Servidores.get_servidor!(servidor.id) == servidor
    end

    test "create_servidor/1 with valid data creates a servidor" do
      assert {:ok, %Servidor{} = servidor} = Servidores.create_servidor(@valid_attrs)
      assert servidor.cliente == "some cliente"
      assert servidor.descripcion == "some descripcion"
      assert servidor.ip == "some ip"
      assert servidor.puerto == "some puerto"
      assert servidor.servicio == "some servicio"
      assert servidor.servidor == "some servidor"
      assert servidor.status == "some status"
    end

    test "create_servidor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Servidores.create_servidor(@invalid_attrs)
    end

    test "update_servidor/2 with valid data updates the servidor" do
      servidor = servidor_fixture()
      assert {:ok, servidor} = Servidores.update_servidor(servidor, @update_attrs)
      assert %Servidor{} = servidor
      assert servidor.cliente == "some updated cliente"
      assert servidor.descripcion == "some updated descripcion"
      assert servidor.ip == "some updated ip"
      assert servidor.puerto == "some updated puerto"
      assert servidor.servicio == "some updated servicio"
      assert servidor.servidor == "some updated servidor"
      assert servidor.status == "some updated status"
    end

    test "update_servidor/2 with invalid data returns error changeset" do
      servidor = servidor_fixture()
      assert {:error, %Ecto.Changeset{}} = Servidores.update_servidor(servidor, @invalid_attrs)
      assert servidor == Servidores.get_servidor!(servidor.id)
    end

    test "delete_servidor/1 deletes the servidor" do
      servidor = servidor_fixture()
      assert {:ok, %Servidor{}} = Servidores.delete_servidor(servidor)
      assert_raise Ecto.NoResultsError, fn -> Servidores.get_servidor!(servidor.id) end
    end

    test "change_servidor/1 returns a servidor changeset" do
      servidor = servidor_fixture()
      assert %Ecto.Changeset{} = Servidores.change_servidor(servidor)
    end
  end
end
