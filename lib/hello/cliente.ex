defmodule Hello.Cliente do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Cliente


  schema "clientes" do
    field :descripcion, :string
    field :nombre, :string
    field :numero, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(%Cliente{} = cliente, attrs) do
    cliente
    |> cast(attrs, [:nombre, :descripcion, :numero, :status])
    |> validate_required([:nombre, :descripcion, :numero, :status])
  end
end
