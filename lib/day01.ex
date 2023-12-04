defmodule Advent2023.Day01 do
  def first_and_last_ints(char_list) do
    int_list =
      char_list
      |> Enum.filter(fn char -> match?({_int, _}, Integer.parse(char)) end)

    first = int_list |> hd()
    last = int_list |> Enum.take(-1) |> hd()

    {int, _} = (first <> last) |> Integer.parse()

    int
  end

  defmodule A do
    def solve(input) do
      input
      |> Advent2023.Util.parse_chars()
      |> Enum.map(&Advent2023.Day01.first_and_last_ints/1)
      |> Enum.sum()
    end
  end
end
