defmodule UploadsMvp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UploadsMvp.Repo,
      # Start the Telemetry supervisor
      UploadsMvpWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: UploadsMvp.PubSub},
      # Start the Endpoint (http/https)
      UploadsMvpWeb.Endpoint
      # Start a worker by calling: UploadsMvp.Worker.start_link(arg)
      # {UploadsMvp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UploadsMvp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UploadsMvpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
