defmodule Hello.Repo.Migrations.CreateHolding do
  use Ecto.Migration

  def change do
    create table(:holding) do
      add :symbol, :string
      add :exchange, :string
      add :isin, :string
      add :quantity, :integer
      add :auth_date, :naive_datetime
      add :avg_price, :float
      add :last_price, :float
      add :close_price, :float
      add :pnl, :float
      add :day_change, :float
      add :day_change_perc, :float

      timestamps(type: :utc_datetime)
    end
  end
end
