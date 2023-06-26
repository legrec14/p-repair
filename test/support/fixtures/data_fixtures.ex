defmodule Prepair.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Prepair.Data` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        bought_new: true,
        category: "some category",
        country_of_origin: "some country_of_origin",
        date_of_purchase: ~D[2023-06-22],
        date_of_registrationn: ~D[2023-06-22],
        description: "some description",
        end_year: ~D[2023-06-22],
        image: "some image",
        in_service: true,
        manufacturer_name: "some manufacturer_name",
        name: "some name",
        Prepair: "some Prepair",
        original: true,
        parts: "some parts",
        profile: "some profile",
        reference: "some reference",
        serial_number: "some serial_number",
        start_year: ~D[2023-06-22],
        user: "some user",
        user_manual: "some user_manual",
        warranty_duration: 42
      })
      |> Prepair.Data.create_product()

    product
  end

  @doc """
  Generate a unique category name.
  """
  def unique_category_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        average_lifetime: 42,
        image: "some image",
        name: unique_category_name(),
        Prepair: "some Prepair",
        product: "some product"
      })
      |> Prepair.Data.create_category()

    category
  end
end
