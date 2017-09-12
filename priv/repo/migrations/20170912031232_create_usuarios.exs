defmodule Hello.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :usuario, :string
      add :nombre, :string
      add :apellido, :string
      add :perfil, :string
      add :status, :string

      timestamps()
    end

  end
end
