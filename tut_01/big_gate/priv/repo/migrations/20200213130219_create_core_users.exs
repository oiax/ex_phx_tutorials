defmodule BigGate.Repo.Migrations.CreateCoreUsers do
  use Ecto.Migration

  def change do
    create table(:core_users) do

      timestamps()
    end

  end
end
