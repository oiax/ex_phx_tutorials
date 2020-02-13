defmodule BigGateWeb.PageController do
  use BigGateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn, params) do
    render(conn, "hello.html", name: params["name"])
  end

  def user_list(conn, _params) do
    users = BigGate.Core.fetch_users()
    render(conn, "user_list.html", users: users)
  end
end
