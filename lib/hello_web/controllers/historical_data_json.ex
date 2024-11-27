defmodule HelloWeb.HistoricalDataJSON do

  def index(%{list: list}) do
    %{status: "success", data: list}
  end
end
