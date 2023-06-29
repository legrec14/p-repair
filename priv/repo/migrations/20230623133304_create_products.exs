defmodule Prepair.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :in_service, :boolean, default: false, null: false
      add :original, :boolean, default: false, null: false
      add :manufacturer_name, :string
      add :description, :string
      add :reference, :string, null: false
      add :country_of_origin, :string
      add :bought_new, :boolean, default: false, null: false
      add :date_of_purchase, :date
      add :date_of_registration, :date
      add :start_year, :date
      add :end_year, :date
      add :warranty_duration, :integer
      add :image, :string
      add :user_manual, :string
      add :parts, :string
      add :serial_number, :string
      add :user, :string, null: false
      add :profile, :string
      add :notifications, :string
      add :views, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
