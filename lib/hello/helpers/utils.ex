defmodule Hello.Helpers.Utils do
  alias NimbleCSV.RFC4180, as: CSV

  def read_file(path) do
    File.read!(path)
  end

  def parse_csv(path \\ "historical_prices.csv") do
    read_file(path)
    |> CSV.parse_string()
  end

  def string_to_number(val) do
    regex = ~r/[0-9]+\.[0-9]*/

    if Regex.match?(regex, val) do
      String.to_float(val)
    else
      String.to_integer(val)
    end
  end
end
