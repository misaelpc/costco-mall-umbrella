defmodule CostcoMallEe.Repo do
  use Ecto.Repo,
    otp_app: :costco_mall_ee,
    adapter: Ecto.Adapters.Postgres
end
