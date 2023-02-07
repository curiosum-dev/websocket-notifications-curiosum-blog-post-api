defmodule Pushes.Repo do
  use Ecto.Repo,
    otp_app: :pushes,
    adapter: Ecto.Adapters.Postgres
end
