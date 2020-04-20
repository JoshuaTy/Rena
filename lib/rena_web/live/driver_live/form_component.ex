defmodule RenaWeb.DriverLive.FormComponent do
  use RenaWeb, :live_component

  alias Rena.Accounts

  @impl true
  def update(%{driver: driver} = assigns, socket) do
    changeset = Accounts.change_driver(driver)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"driver" => driver_params}, socket) do
    changeset =
      socket.assigns.driver
      |> Accounts.change_driver(driver_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"driver" => driver_params}, socket) do
    save_driver(socket, socket.assigns.action, driver_params)
  end

  defp save_driver(socket, :edit, driver_params) do
    case Accounts.update_driver(socket.assigns.driver, driver_params) do
      {:ok, _driver} ->
        {:noreply,
         socket
         |> put_flash(:info, "Driver updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_driver(socket, :new, driver_params) do
    case Accounts.create_driver(driver_params) do
      {:ok, _driver} ->
        {:noreply,
         socket
         |> put_flash(:info, "Driver created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
