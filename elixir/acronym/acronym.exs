defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(fn(s) -> construct_abbreviations(s) end)
    |> List.to_string()
  end

  def construct_abbreviations(string) do
    string
    |> String.graphemes()
    |> capitalize_first()
    |> extract_caps()
  end

  defp capitalize_first([f|rest]) do
    [String.capitalize(f)|rest]
  end

  defp extract_caps(graphemes) do
    graphemes
    |> Enum.filter(fn(c) -> is_alpha_upper?(c) end)
  end

  defp is_alpha_upper?(string) do
    is_upper =
      string
      |> String.upcase()
      |> String.equivalent?(string)

    is_lower =
      string
      |> String.downcase()
      |> String.equivalent?(string)

    is_upper && !is_lower
  end
end
