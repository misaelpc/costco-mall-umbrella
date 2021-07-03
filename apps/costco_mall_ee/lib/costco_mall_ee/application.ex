defmodule CostcoMallEe.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CostcoMallEe.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CostcoMallEe.PubSub}
      # Start a worker by calling: CostcoMallEe.Worker.start_link(arg)
      # {CostcoMallEe.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: CostcoMallEe.Supervisor)
  end
end
