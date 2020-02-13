defmodule Gamma do
  def transform(str) do
    c =
      str
      |> String.trim()
      |> String.downcase()
      |> String.reverse()

    IO.inspect(c)
  end
end
