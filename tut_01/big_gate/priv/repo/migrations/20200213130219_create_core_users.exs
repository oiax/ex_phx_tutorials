defmodule BigGate.Repo.Migrations.CreateCoreUsers do
  use Ecto.Migration

  def change do
    create table(:core_users) do
      add(:name, :string, null: false)
      add(:email, :string, null: false)

      timestamps()
    end

    create(unique_index(:core_users, :name))
  end
end
