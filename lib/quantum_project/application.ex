defmodule QuantumProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      QuantumProject.Repo,
      # Start the Telemetry supervisor
      QuantumProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: QuantumProject.PubSub},
      # Start the Endpoint (http/https)
      QuantumProjectWeb.Endpoint,
      QuantumProject.Scheduler
      # Start a worker by calling: QuantumProject.Worker.start_link(arg)
      # {QuantumProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: QuantumProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QuantumProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
