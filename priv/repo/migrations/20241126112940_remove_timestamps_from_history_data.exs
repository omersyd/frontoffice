defmodule Hello.Repo.Migrations.RemoveTimestampsFromHistoryData do
  use Ecto.Migration

  def change do
    alter table(:history_data) do
      remove :inserted_at, :naive_datetime
      remove :updated_at, :naive_datetime
    end
  end
end
