defmodule Alpha do
  @moduledoc """
  Documentation for `Alpha`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Alpha.hello()
      :world

  """
  def hello do
    :world
  end

  def print do
    IO.inspect(hello())
  end

  def unshift do
    a = ["x", "y", "z"]
    b = ["w" | a]
    IO.inspect(b)
  end

  def push do
    a = ["x", "y", "z"]
    b = a ++ ["w"]
    IO.inspect(b)
  end

  def put_and_delete do
    m1 = %{"red" => 0, "green" => 1, "blue" => 2}
    m2 = Map.put(m1, "black", 3)
    m3 = Map.put(m2, "red", 4)
    m4 = Map.delete(m3, "green")
    IO.inspect(m4)
  end

  def get_value do
    m = %{red: 0, green: 1, blue: 2}
    c1 = Map.get(m, :red)
    c2 = m.green
    IO.inspect([c1, c2])
  end
end
