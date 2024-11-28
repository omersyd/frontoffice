defmodule HelloWeb.HoldingController do
  use HelloWeb, :controller
  alias Hello.Helpers.Holding

  def index(conn, params) do
    uid = params["uid"]
    list = Holding.get_holdings_by_uid(uid)
    render(conn, :index, list: list)
  end
end
