defmodule CostcoMallEeWeb.PageController do
  use CostcoMallEeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
