defmodule Hello.Repo.Migrations.AddUidToHoldings do
  use Ecto.Migration

  def change do
    alter table(:holding) do
      add :uid, :string
    end
  end
end
