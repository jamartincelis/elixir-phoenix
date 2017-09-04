defmodule Hello.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes) do
      add :nombre, :string
      add :descripcion, :string
      add :"\\", :string
      add :numero, :string
      add :status, :string

      timestamps()
    end

  end
end
