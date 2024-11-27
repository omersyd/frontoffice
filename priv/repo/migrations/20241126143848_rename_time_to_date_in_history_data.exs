defmodule Hello.Repo.Migrations.RenameTimeToDateInHistoryData do
  use Ecto.Migration

  def change do
    rename table(:history_data), :time, to: :date
  end
end
