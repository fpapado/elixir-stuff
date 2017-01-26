defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words_normal = sentence
    |> String.replace(~r/[\p{P}\p{S}]/, "")
    |> String.downcase()
    |> String.split()

    count_words(%{}, words_normal)
  end

  defp count_words(res, [h|t]) do
    case Map.has_key?(res, h) do
      true ->
        Map.update!(res, h, &(&1 + 1))

      false ->
        Map.put(res, h, 1)
    end
    |> count_words(t)
  end

  defp count_words(res, []) do
    res
  end
end
