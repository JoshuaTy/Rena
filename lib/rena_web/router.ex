defmodule RenaWeb.Router do
  use RenaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RenaWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/drivers", DriverLive.Index, :index
    live "/drivers/new", DriverLive.Index, :new
    live "/drivers/:id/edit", DriverLive.Index, :edit

    live "/drivers/:id", DriverLive.Show, :show
    live "/drivers/:id/show/edit", DriverLive.Show, :edit

    # resources "/users", only: [:index, :new, :create, :show, :update, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", RenaWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: RenaWeb.Telemetry
    end
  end
end
