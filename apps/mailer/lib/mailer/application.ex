defmodule Mailer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  defp poolboy_config do
    [
      name: {:local, :worker},
      worker_module: Mailer.MailerWorker,
      size: 10,
      max_overflow: 5
    ]
  end

  @impl true
  def start(_type, _args) do
    children = [
      :poolboy.child_spec(:worker, poolboy_config())
      #{Mailer.MailerWorker, [:hello, :misael, :elixir]}
      # Starts a worker by calling: Mailer.Worker.start_link(arg)
      # {Mailer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mailer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
