defmodule PrepairWeb.Router do
  use PrepairWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PrepairWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # Defines english as the default language,
    # if no params are found by the call function.
    plug PrepairWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PrepairWeb do
    pipe_through :browser

    get "/", PageController, :home
    resources "/products", ProductController
    resources "/categories", CategoryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PrepairWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:prepair, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PrepairWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
