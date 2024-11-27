defmodule HelloWeb.HistoricalDataController do
  use HelloWeb, :controller
  alias Hello.Helpers.HistoryData

  def index(conn, params) do
    list =
      HistoryData.get_data_with_range(params["symbol"], params["from_date"], params["to_date"])

    render(conn, :index, list: list)
  end
end
