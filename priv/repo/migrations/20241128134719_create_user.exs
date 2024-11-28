defmodule Hello.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :uid, :string
      add :type, :string
      add :email, :string
      add :name, :string
      add :broker, :string

      timestamps(type: :utc_datetime)
    end
  end
end
