defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.graphemes
    |> compress("", 0)
  end

  defp compress([], _curr, 0) do
    ""
  end

  defp compress([], curr, rl) do
    "#{rl}#{curr}"
  end

  defp compress([current|tail], "", rl) do
    "" <> compress(tail, current, rl+1)
  end

  defp compress([current|tail], current, rl) do
    "" <> compress(tail, current, rl+1)
  end

  defp compress([current|tail], previous, rl) do
    "#{rl}#{previous}" <> compress(tail, current, 1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.graphemes
    |> decompress("")
  end

  defp decompress([], "") do
    ""
  end

  defp decompress([head|tail], rl) do
    case Integer.parse(head) do
      {val, _} -> decompress(tail, rl <> head)
      :error ->
        repeat = String.to_integer(rl)
        decompressed = String.duplicate(head, repeat)

        decompressed <> decompress(tail, "")
    end
  end
end
