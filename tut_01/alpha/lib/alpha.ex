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
end
