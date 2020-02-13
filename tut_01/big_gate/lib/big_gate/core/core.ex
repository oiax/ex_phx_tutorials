defmodule BigGate.Core do
  require Ecto.Query

  def fetch_users() do
    BigGate.Core.User
    |> Ecto.Query.order_by(asc: :name)
    |> BigGate.Repo.all()
  end
end
