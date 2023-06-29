defmodule Prepair.Data.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :average_lifetime, :integer
    field :image, :string
    field :name, :string
    field :notifications, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :image, :average_lifetime, :notifications])
    |> validate_required(:name)
    |> unique_constraint(:name)
  end
end
