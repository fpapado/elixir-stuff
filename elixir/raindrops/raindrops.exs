defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    rainspeak =
      [[3, "Pling"], [5, "Plang"], [7, "Plong"]]
      |> Enum.map(&str_if_factor(number, &1))
      |> Enum.join("")

    case rainspeak do
      "" -> to_string(number)
      _ -> rainspeak
    end
  end

  def str_if_factor(num, [factor, str]) do
    case rem(num, factor) do
      0 -> str
      _ -> ""
    end
  end
end
