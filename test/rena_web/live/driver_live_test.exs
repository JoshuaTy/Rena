defmodule RenaWeb.DriverLiveTest do
  use RenaWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Rena.Accounts

  @create_attrs %{is_available: true, wallet_balance: 42}
  @update_attrs %{is_available: false, wallet_balance: 43}
  @invalid_attrs %{is_available: nil, wallet_balance: nil}

  defp fixture(:driver) do
    {:ok, driver} = Accounts.create_driver(@create_attrs)
    driver
  end

  defp create_driver(_) do
    driver = fixture(:driver)
    %{driver: driver}
  end

  describe "Index" do
    setup [:create_driver]

    test "lists all drivers", %{conn: conn, driver: driver} do
      {:ok, _index_live, html} = live(conn, Routes.driver_index_path(conn, :index))

      assert html =~ "Listing Drivers"
    end

    test "saves new driver", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.driver_index_path(conn, :index))

      assert index_live |> element("a", "New Driver") |> render_click() =~
        "New Driver"

      assert_patch(index_live, Routes.driver_index_path(conn, :new))

      assert index_live
             |> form("#driver-form", driver: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#driver-form", driver: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.driver_index_path(conn, :index))

      assert html =~ "Driver created successfully"
    end

    test "updates driver in listing", %{conn: conn, driver: driver} do
      {:ok, index_live, _html} = live(conn, Routes.driver_index_path(conn, :index))

      assert index_live |> element("#driver-#{driver.id} a", "Edit") |> render_click() =~
        "Edit Driver"

      assert_patch(index_live, Routes.driver_index_path(conn, :edit, driver))

      assert index_live
             |> form("#driver-form", driver: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#driver-form", driver: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.driver_index_path(conn, :index))

      assert html =~ "Driver updated successfully"
    end

    test "deletes driver in listing", %{conn: conn, driver: driver} do
      {:ok, index_live, _html} = live(conn, Routes.driver_index_path(conn, :index))

      assert index_live |> element("#driver-#{driver.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#driver-#{driver.id}")
    end
  end

  describe "Show" do
    setup [:create_driver]

    test "displays driver", %{conn: conn, driver: driver} do
      {:ok, _show_live, html} = live(conn, Routes.driver_show_path(conn, :show, driver))

      assert html =~ "Show Driver"
    end

    test "updates driver within modal", %{conn: conn, driver: driver} do
      {:ok, show_live, _html} = live(conn, Routes.driver_show_path(conn, :show, driver))

      assert show_live |> element("a", "Edit") |> render_click() =~
        "Edit Driver"

      assert_patch(show_live, Routes.driver_show_path(conn, :edit, driver))

      assert show_live
             |> form("#driver-form", driver: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#driver-form", driver: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.driver_show_path(conn, :show, driver))

      assert html =~ "Driver updated successfully"
    end
  end
end
