defmodule HelloWeb.Router do
  use HelloWeb, :router

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

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", LoginController, :login
    get "/index", LoginController, :login
    get "/bitacora", BitacoraController, :index
    get "/bitacora/admin/clientes", BitacoraController, :clientes
    get "/bitacora/admin/servidores", BitacoraController, :servidores
    get "/bitacora/estadisticas/total-sms", BitacoraController, :totalSms
    get "/bitacora/seguridad/usuarios", BitacoraController, :usuarios
    get "/logout", BitacoraController, :logout

    #get "/", PageController, :index
    #get "/hello", HelloController, :index
    #get "/login", LoginController, :login
    #get "/login/:username/:password" LoginController :redirect_bitacora

  end

  # New route for login
  #scope "/login", HelloWeb do
  #    pipe_through :browser # Use the default browser stack
    #get "/login", LoginController, :redirect_bitacora, as: :redirect_bitacora
  #  get "/", LoginController, :bitacora
    #get "/bitacora", LoginController, :login
  #end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end
