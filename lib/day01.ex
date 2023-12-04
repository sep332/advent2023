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

  defmodule B do
    @doc """
      For each character in the row, create a candidate string from that character to the end of the row.
      Test each candidate string in order to see if it starts with a digit or number word. Take the first one.
      Flip the order of candidate strings and search again. That's the last one.
      Stick the digits together and parse as an integer. Repeat for each row and sum at the end.
    """
    def solve(input) do
      input
      |> Advent2023.Util.parse_strings()
      |> Enum.map(
        fn row -> 
          char_list = row |> String.split("", trim: true)

          char_list
          |> Enum.reduce(
            {[], 0},
            fn _char, {candidates, position} ->
              {candidates ++ [(Enum.take(char_list, -(length(char_list) - position)) |> Enum.join())], position + 1}
            end
          )
          |> first_and_last_digits()
        end
      )
      |> Enum.sum()
    end

    def first_and_last_digits({candidates, _}) do
      first =
        candidates
        |> Enum.find_value(&get_digit/1)

      last =
        candidates
        |> Enum.reverse()
        |> Enum.find_value(&get_digit/1)

      {int, _} = "#{first}#{last}" |> Integer.parse()

      int  
    end

    def get_digit("1" <> _), do: 1
    def get_digit("2" <> _), do: 2
    def get_digit("3" <> _), do: 3
    def get_digit("4" <> _), do: 4
    def get_digit("5" <> _), do: 5
    def get_digit("6" <> _), do: 6
    def get_digit("7" <> _), do: 7
    def get_digit("8" <> _), do: 8
    def get_digit("9" <> _), do: 9
    def get_digit("one" <> _), do: 1
    def get_digit("two" <> _), do: 2
    def get_digit("three" <> _), do: 3
    def get_digit("four" <> _), do: 4
    def get_digit("five" <> _), do: 5
    def get_digit("six" <> _), do: 6
    def get_digit("seven" <> _), do: 7
    def get_digit("eight" <> _), do: 8
    def get_digit("nine" <> _), do: 9
    def get_digit(_), do: :false
  end
end
