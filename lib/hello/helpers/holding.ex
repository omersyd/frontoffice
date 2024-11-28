defmodule Hello.Helpers.Holding do
  alias Hello.{Models.Holding, Repo}
  import Ecto.Query

  def all() do
    Repo.all(Holding)
  end

  def insert(holding) do
    holding = %{
      holding
      | avg_price: holding.avg_price * 1.0,
        last_price: holding.last_price * 1.0,
        close_price: holding.close_price * 1.0,
        pnl: holding.pnl * 1.0,
        day_change: holding.day_change * 1.0,
        day_change_perc: holding.day_change_perc * 1.0,
        auth_date: NaiveDateTime.from_iso8601!(holding.auth_date)
    }

    Repo.insert(struct(Holding, holding))
  end

  def get_holdings_by_uid(uid) do
    query = from u in Holding, where: u.uid == ^uid

    Repo.all(query)
    |> Enum.map(fn holding ->
      %{
        tradingsymbol: holding.symbol,
        exchange: holding.exchange,
        isin: holding.isin,
        quantity: holding.quantity,
        authorised_date: NaiveDateTime.to_string(holding.auth_date),
        average_price: holding.avg_price,
        last_price: holding.last_price,
        close_price: holding.close_price,
        pnl: holding.pnl,
        day_change: holding.day_change,
        day_change_percentage: holding.day_change_perc
      }
    end)
  end
end
