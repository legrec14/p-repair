defmodule Prepair.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :image, :string
      add :average_lifetime, :integer
      add :notifications, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:categories, [:name])
  end
end
