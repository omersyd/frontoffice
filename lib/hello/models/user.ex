defmodule Hello.Models.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :type, :string
    field :uid, :string
    field :email, :string
    field :broker, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:uid, :type, :email, :name, :broker])
    |> validate_required([:uid, :type, :email, :name, :broker])
  end
end
