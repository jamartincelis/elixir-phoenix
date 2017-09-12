defmodule Hello.ClientesTest do
  use Hello.DataCase

  alias Hello.Clientes

  describe "clientes" do
    alias Hello.Clientes.Cliente

    @valid_attrs %{descripcion: "some descripcion", nombre: "some nombre", numero: "some numero", status: "some status"}
    @update_attrs %{descripcion: "some updated descripcion", nombre: "some updated nombre", numero: "some updated numero", status: "some updated status"}
    @invalid_attrs %{descripcion: nil, nombre: nil, numero: nil, status: nil}

    def cliente_fixture(attrs \\ %{}) do
      {:ok, cliente} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clientes.create_cliente()

      cliente
    end

    test "list_clientes/0 returns all clientes" do
      cliente = cliente_fixture()
      assert Clientes.list_clientes() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Clientes.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      assert {:ok, %Cliente{} = cliente} = Clientes.create_cliente(@valid_attrs)
      assert cliente.descripcion == "some descripcion"
      assert cliente.nombre == "some nombre"
      assert cliente.numero == "some numero"
      assert cliente.status == "some status"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clientes.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      assert {:ok, cliente} = Clientes.update_cliente(cliente, @update_attrs)
      assert %Cliente{} = cliente
      assert cliente.descripcion == "some updated descripcion"
      assert cliente.nombre == "some updated nombre"
      assert cliente.numero == "some updated numero"
      assert cliente.status == "some updated status"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Clientes.update_cliente(cliente, @invalid_attrs)
      assert cliente == Clientes.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Clientes.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Clientes.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Clientes.change_cliente(cliente)
    end
  end
end
