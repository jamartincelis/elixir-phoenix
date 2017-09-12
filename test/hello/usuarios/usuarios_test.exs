defmodule Hello.UsuariosTest do
  use Hello.DataCase

  alias Hello.Usuarios

  describe "usuarios" do
    alias Hello.Usuarios.Usuario

    @valid_attrs %{apellido: "some apellido", nombre: "some nombre", perfil: "some perfil", status: "some status", usuario: "some usuario"}
    @update_attrs %{apellido: "some updated apellido", nombre: "some updated nombre", perfil: "some updated perfil", status: "some updated status", usuario: "some updated usuario"}
    @invalid_attrs %{apellido: nil, nombre: nil, perfil: nil, status: nil, usuario: nil}

    def usuario_fixture(attrs \\ %{}) do
      {:ok, usuario} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usuarios.create_usuario()

      usuario
    end

    test "list_usuarios/0 returns all usuarios" do
      usuario = usuario_fixture()
      assert Usuarios.list_usuarios() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Usuarios.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      assert {:ok, %Usuario{} = usuario} = Usuarios.create_usuario(@valid_attrs)
      assert usuario.apellido == "some apellido"
      assert usuario.nombre == "some nombre"
      assert usuario.perfil == "some perfil"
      assert usuario.status == "some status"
      assert usuario.usuario == "some usuario"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      assert {:ok, usuario} = Usuarios.update_usuario(usuario, @update_attrs)
      assert %Usuario{} = usuario
      assert usuario.apellido == "some updated apellido"
      assert usuario.nombre == "some updated nombre"
      assert usuario.perfil == "some updated perfil"
      assert usuario.status == "some updated status"
      assert usuario.usuario == "some updated usuario"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_usuario(usuario, @invalid_attrs)
      assert usuario == Usuarios.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Usuarios.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_usuario(usuario)
    end
  end
end
