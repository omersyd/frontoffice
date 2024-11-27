defmodule Hello.Repo.Migrations.CreateHistoryData do
  use Ecto.Migration

  def change do
    create table(:history_data) do
      add :time, :naive_datetime
      add :price, :float
      add :symbol, :string

      timestamps(type: :utc_datetime)
    end
  end
end
