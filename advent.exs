defmodule Advent2023.Runner do
  @doc "Parse command line arguments, load data files, run solve()"
  def run() do
    options = 
    System.argv()
    |> OptionParser.parse(strict: [])

    with
      {_options, [day, part], _} <- options,
      {_int, _} <- Integer.parse(day)
    do
      day_str = String.pad_leading(day, 2, "0")
      Kernel.apply(
        "Elixir.Advent2023.Day" <> day_str <> "." <> part |> String.to_atom(),
        :solve,
        [File.read!("priv/day" <> day_str <> ".txt")]
      )
      |> IO.puts()
    end
  end
end

Advent2023.Runner.run()
