defmodule Prepair.Data.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Prepair.Data.Category

  schema "products" do
    field :bought_new, :boolean, default: false
    field :category, :string
    field :country_of_origin, :string
    field :date_of_purchase, :date
    field :date_of_registration, :date
    field :description, :string
    field :end_year, :date
    field :image, :string
    field :in_service, :boolean, default: false
    field :manufacturer_name, :string
    field :name, :string
    field :notifications, :string
    field :original, :boolean, default: false
    field :parts, :string
    field :profile, :string
    field :reference, :string
    field :serial_number, :string
    field :start_year, :date
    field :user, :string
    field :user_manual, :string
    field :warranty_duration, :integer
    field :views, :integer

    many_to_many :categories, Category, join_through: "product_categories", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [
      :name,
      :in_service,
      :original,
      :manufacturer_name,
      :category,
      :description,
      :reference,
      :country_of_origin,
      :bought_new,
      :date_of_purchase,
      :date_of_registration,
      :start_year,
      :end_year,
      :warranty_duration,
      :image,
      :user_manual,
      :parts,
      :serial_number,
      :user,
      :profile,
      :notifications,
      :views
    ])
    |> validate_required([
      :name,
      :original,
      :manufacturer_name,
      :category,
      :reference,
      :bought_new,
      :date_of_purchase,
      :warranty_duration,
      :user,
      :profile
    ])
  end
end
