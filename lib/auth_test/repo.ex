defmodule AuthTest.Repo do
  use Ecto.Repo,
    otp_app: :auth_test,
    adapter: Ecto.Adapters.Postgres
end
