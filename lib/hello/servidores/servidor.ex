defmodule Hello.Servidores.Servidor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Servidores.Servidor


  schema "servidores" do
    field :cliente, :string
    field :descripcion, :string
    field :ip, :string
    field :puerto, :string
    field :servicio, :string
    field :servidor, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(%Servidor{} = servidor, attrs) do
    servidor
    |> cast(attrs, [:servidor, :ip, :puerto, :servicio, :cliente, :descripcion, :status])
    |> validate_required([:servidor, :ip, :puerto, :servicio, :cliente, :descripcion, :status])
  end
end
