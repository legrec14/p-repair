defmodule PrepairWeb.ContactController do
  use PrepairWeb, :controller

  def contact(conn, _params) do
    render(conn, :contact)
  end

  def show(conn, %{"messenger" => messenger} = _params) do
    render(conn, :show, messenger: messenger)
  end
end
