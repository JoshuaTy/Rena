defmodule Rena.Repo do
  use Ecto.Repo,
    otp_app: :rena,
    adapter: Ecto.Adapters.Postgres
end
