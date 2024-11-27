defmodule Hello.Models.HistoryData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "history_data" do
    field :date, :naive_datetime
    field :symbol, :string
    field :price, :float
  end

  @doc false
  def changeset(history_data, attrs) do
    history_data
    |> cast(attrs, [:date, :price, :symbol])
    |> validate_required([:date, :price, :symbol])
  end
end
