defmodule Delta do
  def transform(str) do
    a = String.trim(str)
    b = String.downcase(a)
    c = append(b, "@")
    IO.inspect(c)
  end

  defp append(str, char) do
    char <> str
  end
end
