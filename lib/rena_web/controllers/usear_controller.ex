defmodule RenaWeb.UseradController do
  use RenaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
