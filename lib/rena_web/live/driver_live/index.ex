defmodule RenaWeb.DriverLive.Index do
  use RenaWeb, :live_view

  alias Rena.Accounts
  alias Rena.Accounts.Driver

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :drivers, fetch_drivers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Driver")
    |> assign(:driver, Accounts.get_driver!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Driver")
    |> assign(:driver, %Driver{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Drivers")
    |> assign(:driver, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    driver = Accounts.get_driver!(id)
    {:ok, _} = Accounts.delete_driver(driver)

    {:noreply, assign(socket, :drivers, fetch_drivers())}
  end

  defp fetch_drivers do
    Accounts.list_drivers()
  end
end
