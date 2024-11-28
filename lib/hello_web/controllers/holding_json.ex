defmodule HelloWeb.HoldingJSON do
  def index(%{list: list}) do
    %{status: "success", data: list}
  end
end
