defmodule Gamma do
  def transform(str) do
    a = String.trim(str)
    b = String.downcase(a)
    c = String.reverse(b)
    IO.inspect(c)
  end
end
