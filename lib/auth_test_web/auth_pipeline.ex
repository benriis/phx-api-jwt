defmodule AuthTest.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :auth_test,
  module: AuthTest.Guardian,
  error_handler: AuthTest.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
