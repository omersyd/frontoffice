defmodule HelloWeb.ChartLive do
  use HelloWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-4">
      <div id="holdings-container" phx-hook="Holding" class="flex w-full">
        <div class="w-4/12">
          <div id="profile-card">
            <!-- Card will be dynamically inserted here -->
          </div>
          <div id="profit-loss-card" class="my-4 w-full"></div>
        </div>
        <div class="w-8/12">
          <div class="font-semibold text-2xl mb-2">
            User Holdings
          </div>
          <!-- Table Container -->
          <div id="table-container" class="overflow-x-auto">
            <!-- Table will be dynamically inserted here -->
          </div>
        </div>
      </div>
      <!-- Chart Container -->
      <div class="p-2 mt-8 flex flex-col items-center">
        <!-- Dropdown -->
        <select
          id="symbol-select"
          class="w-64 p-2 mb-4 text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        >
          <option value="NIFTY 50">NIFTY 50</option>
          <option value="NIFTY BANK">NIFTY BANK</option>
        </select>
        <!-- Date Range Inputs -->
        <div id="foo" class="flex items-center space-x-2 mb-4">
          <input
            type="text"
            name="start"
            placeholder="From Date"
            class="w-32 p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
          <span class="text-gray-600">to</span>
          <input
            type="text"
            name="end"
            placeholder="To Date"
            class="w-32 p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
        </div>
        <!-- Button -->
        <button
          id="fetch-btn"
          class="w-64 px-4 py-2 text-white bg-blue-600 rounded-md shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
        >
          Fetch
        </button>
      </div>

      <div id="chart-container" phx-hook="Chart" class="relative"></div>
    </div>
    """
  end
end
