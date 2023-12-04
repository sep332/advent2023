defmodule Advent2023.Day01Test do
  use ExUnit.Case

  @testdata_a """
  1abc2
  pqr3stu8vwx
  a1b2c3d4e5f
  treb7uchet
  """

  @testanswer_a 142

  test "Day01 A" do
    assert @testdata_a |> Advent2023.Day01.A.solve() == @testanswer_a
  end

  @testdata_b """
  two1nine
  eightwothree
  abcone2threexyz
  xtwone3four
  4nineeightseven2
  zoneight234
  7pqrstsixteen
  """

  @testanswer_b 281

  test "Day01 B" do
    assert @testdata_b |> Advent2023.Day01.B.solve() == @testanswer_b
  end
end
