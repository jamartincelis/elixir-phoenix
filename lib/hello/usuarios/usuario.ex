defmodule Hello.Usuarios.Usuario do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Usuarios.Usuario


  schema "usuarios" do
    field :apellido, :string
    field :nombre, :string
    field :perfil, :string
    field :status, :string
    field :usuario, :string

    timestamps()
  end

  @doc false
  def changeset(%Usuario{} = usuario, attrs) do
    usuario
    |> cast(attrs, [:usuario, :nombre, :apellido, :perfil, :status])
    |> validate_required([:usuario, :nombre, :apellido, :perfil, :status])
  end
end
