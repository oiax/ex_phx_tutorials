defmodule Delta do
  def transform(str) do
    c =
      str
      |> String.trim()
      |> String.downcase()
      |> append("@")

    IO.inspect(c)
  end

  defp append(str, char) do
    char <> str
  end
end
