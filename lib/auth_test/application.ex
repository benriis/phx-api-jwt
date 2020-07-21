defmodule AuthTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AuthTest.Repo,
      # Start the Telemetry supervisor
      AuthTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AuthTest.PubSub},
      # Start the Endpoint (http/https)
      AuthTestWeb.Endpoint
      # Start a worker by calling: AuthTest.Worker.start_link(arg)
      # {AuthTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AuthTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AuthTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
