# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BigGate.Repo.insert!(%BigGate.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

BigGate.Repo.delete_all(BigGate.Core.User)

BigGate.Repo.insert!(%BigGate.Core.User{name: "Alice", email: "alice@example.com"})
BigGate.Repo.insert!(%BigGate.Core.User{name: "Bob", email: "bob@example.com"})
BigGate.Repo.insert!(%BigGate.Core.User{name: "Carol", email: "carol@example.com"})
