defmodule HelloWeb.ChartLive do
  use HelloWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <select id="symbol-select">
        <option value="NIFTY 50">NIFTY 50</option>
        <option value="NIFTY BANK">NIFTY BANK</option>
      </select>
      <div id="foo">
        <input type="text" name="start" placeholder="from date" />
        <span>to</span>
        <input type="text" name="end" placeholder="to date" />
      </div>
      <button id="fetch-btn">Fetch</button>
      <div id="chart-container" phx-hook="Chart" class="relative"></div>
    </div>
    """
  end
end
