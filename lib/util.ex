defmodule Advent2023.Util do
  @doc "Split a file into lines, and return a list of strings."
  def parse_strings(data) do
    data
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
  end

  def parse_chars(data) do
    data
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(&String.split(&1, ""))
  end
end
