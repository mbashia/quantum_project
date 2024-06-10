defmodule QuantumProjectWeb.PageController do
  use QuantumProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
