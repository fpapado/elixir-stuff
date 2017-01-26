defmodule Bob do
  def hey(input) do
    cond do
      is_silence(input) -> "Fine. Be that way!"
      is_question(input) -> "Sure."
      is_yelling(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_question(input) do
    input
    |> String.ends_with?("?")
  end

  defp is_yelling(input) do
    is_upper =
      input
      |> String.upcase()
      |> String.equivalent?(input)

    is_lower =
      input
      |> String.downcase()
      |> String.equivalent?(input)

    is_upper && !is_lower
  end

  defp is_silence(input) do
    input
    |> String.trim()
    |> is_nothing()
  end

  defp is_nothing("") do
    true
  end

  defp is_nothing(_) do
    false
  end
end
