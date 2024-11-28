defmodule Hello.Helpers.User do
  alias Hello.{Models.User, Repo}
  import Ecto.Query

  def all() do
    Repo.all(User)
  end

  def insert(user) do
    Repo.insert(struct(User, user))
  end

  def get_user_by_email(email) do
    query = from u in User, where: u.email == ^email
    list = Repo.all(query)

    if length(list) != 0 do
      hd(list)
    else
      nil
    end
  end
end
