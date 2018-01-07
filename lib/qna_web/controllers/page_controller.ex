defmodule QnaWeb.PageController do
  use QnaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
