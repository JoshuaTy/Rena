defmodule RenaWeb.DriverLive.Show do
  use RenaWeb, :live_view

  alias Rena.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:driver, Accounts.get_driver!(id))}
  end

  defp page_title(:show), do: "Show Driver"
  defp page_title(:edit), do: "Edit Driver"
end
