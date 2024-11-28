defmodule HelloWeb.UserJSON do
  def index(%{user: user}) do
    %{status: "success", data: user}
  end

  def error(%{error: error}) do
    %{status: "failed", error: error}
  end
end
