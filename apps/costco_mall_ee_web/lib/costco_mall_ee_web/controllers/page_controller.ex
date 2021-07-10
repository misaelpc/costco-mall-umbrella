defmodule CostcoMallEeWeb.PageController do
  use CostcoMallEeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def api_index(conn, _params) do
    IO.inspect(self())
    Mailer.MailerOne.send()
    conn
     |> put_status(200)
     |> json(%{message: "ok"})
  end
end
