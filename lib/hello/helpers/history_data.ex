defmodule Hello.Helpers.HistoryData do
  alias Hello.{Helpers.Utils, Models.HistoryData, Repo}
  import Ecto.Query

  def insert_csv_to_database() do
    Utils.parse_csv("historical_prices.csv")
    |> Enum.each(fn [_, date, price, symbol] ->
      date = NaiveDateTime.from_iso8601!(date)
      price = Utils.string_to_number(price) * 1.0
      Repo.insert(struct(HistoryData, %{date: date, price: price, symbol: symbol}))
    end)
  end

  def all() do
    Repo.all(HistoryData)
  end

  def get_data_for_symbol(symbol) do
    query = from h in HistoryData, where: h.symbol == ^symbol
    Repo.all(query)
  end

  def get_data_with_range(symbol, from_date, to_date) do
    from_date = date_to_NaiveDateTime(from_date)
    to_date = date_to_NaiveDateTime(to_date)

    from(h in Hello.Models.HistoryData,
      where: h.symbol == ^symbol and h.date >= ^from_date and h.date <= ^to_date,
      select: %{date: h.date, price: h.price}
    )
    |> Repo.all()
  end

  def date_to_NaiveDateTime(date) do
    Date.from_iso8601!(date)
    |> NaiveDateTime.new!(~T[00:00:00])
    |> NaiveDateTime.to_iso8601()
  end
end
