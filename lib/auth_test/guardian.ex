defmodule AuthTest.Guardian do
  use Guardian, otp_app: :auth_test
  alias AuthTest.Auth.User
  alias AuthTest.Auth

  def subject_for_token(user, _claims) do
    {:ok, user.id}
  end
  # def subject_for_token(_, _) do
  #   {:error, :reason_for_error}
  # end

  def resource_from_claims(claims) do
    id = claims["sub"]
    user = Auth.get_user!(id)
    {:ok,  user}
  end
  # def resource_from_claims(_claims) do
  #   {:error, :reason_for_error}
  # end
end
