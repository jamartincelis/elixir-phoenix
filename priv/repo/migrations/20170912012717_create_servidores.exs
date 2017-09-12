defmodule Hello.Repo.Migrations.CreateServidores do
  use Ecto.Migration

  def change do
    create table(:servidores) do
      add :servidor, :string
      add :ip, :string
      add :puerto, :string
      add :servicio, :string
      add :cliente, :string
      add :descripcion, :string
      add :status, :string

      timestamps()
    end

  end
end
