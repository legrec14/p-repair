defmodule Prepair.Repo do
  use Ecto.Repo,
    otp_app: :prepair,
    adapter: Ecto.Adapters.Postgres
end
