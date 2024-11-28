defmodule Hello.Models.Holding do
  use Ecto.Schema
  import Ecto.Changeset

  schema "holding" do
    field :exchange, :string
    field :symbol, :string
    field :isin, :string
    field :quantity, :integer
    field :auth_date, :naive_datetime
    field :avg_price, :float
    field :last_price, :float
    field :close_price, :float
    field :pnl, :float
    field :day_change, :float
    field :day_change_perc, :float
    field :uid, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(holding, attrs) do
    holding
    |> cast(attrs, [:symbol, :exchange, :isin, :quantity, :auth_date, :avg_price, :last_price, :close_price, :pnl, :day_change, :day_change_perc])
    |> validate_required([:symbol, :exchange, :isin, :quantity, :auth_date, :avg_price, :last_price, :close_price, :pnl, :day_change, :day_change_perc])
  end
end
