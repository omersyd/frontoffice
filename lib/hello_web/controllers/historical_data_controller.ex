defmodule HelloWeb.HistoricalDataController do
  use HelloWeb, :controller
  alias Hello.Helpers.HistoryData

  def index(conn, params) do
    list =
      HistoryData.get_data_with_range(params["symbol"], params["from_date"], params["to_date"])
      |> Enum.map(
          fn item ->
            %{
              time: Date.to_string(NaiveDateTime.to_date(item.date)),
              value: item.price
            }
          end
      )

      # IO.inspect(list, label: "history data")

    render(conn, :index, list: list)
  end
end
