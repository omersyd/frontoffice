defmodule HelloWeb.UserController do
  use HelloWeb, :controller
  alias Hello.Helpers.User

  def index(conn, params) do
    email = params["email"]
    user = User.get_user_by_email(email)

    if user != nil do
      user = %{
        user_id: user.uid,
        user_type: user.type,
        email: user.email,
        user_name: user.name,
        broker: user.broker
      }

      render(conn, :index, user: user)
    else
      render(conn, :error, error: "Incorrect email please try again.")
    end
  end
end
