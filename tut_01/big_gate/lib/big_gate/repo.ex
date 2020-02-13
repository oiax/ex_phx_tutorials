defmodule BigGate.Repo do
  use Ecto.Repo,
    otp_app: :big_gate,
    adapter: Ecto.Adapters.Postgres
end
