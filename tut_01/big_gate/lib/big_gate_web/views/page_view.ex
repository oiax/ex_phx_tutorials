defmodule BigGateWeb.PageView do
  use BigGateWeb, :view

  def format_name(name) do
    String.capitalize(name)
  end
end
