defmodule Prepair.DataTest do
  use Prepair.DataCase

  alias Prepair.Data

  describe "products" do
    alias Prepair.Data.Product

    import Prepair.DataFixtures

    @invalid_attrs %{
      bought_new: nil,
      category: nil,
      country_of_origin: nil,
      date_of_purchase: nil,
      date_of_registrationn: nil,
      description: nil,
      end_year: nil,
      image: nil,
      in_service: nil,
      manufacturer_name: nil,
      name: nil,
      Prepair: nil,
      original: nil,
      parts: nil,
      profile: nil,
      reference: nil,
      serial_number: nil,
      start_year: nil,
      user: nil,
      user_manual: nil,
      warranty_duration: nil
    }

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Data.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Data.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{
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
      }

      assert {:ok, %Product{} = product} = Data.create_product(valid_attrs)
      assert product.bought_new == true
      assert product.category == "some category"
      assert product.country_of_origin == "some country_of_origin"
      assert product.date_of_purchase == ~D[2023-06-22]
      assert product.date_of_registrationn == ~D[2023-06-22]
      assert product.description == "some description"
      assert product.end_year == ~D[2023-06-22]
      assert product.image == "some image"
      assert product.in_service == true
      assert product.manufacturer_name == "some manufacturer_name"
      assert product.name == "some name"
      assert product.Prepair == "some Prepair"
      assert product.original == true
      assert product.parts == "some parts"
      assert product.profile == "some profile"
      assert product.reference == "some reference"
      assert product.serial_number == "some serial_number"
      assert product.start_year == ~D[2023-06-22]
      assert product.user == "some user"
      assert product.user_manual == "some user_manual"
      assert product.warranty_duration == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()

      update_attrs = %{
        bought_new: false,
        category: "some updated category",
        country_of_origin: "some updated country_of_origin",
        date_of_purchase: ~D[2023-06-23],
        date_of_registrationn: ~D[2023-06-23],
        description: "some updated description",
        end_year: ~D[2023-06-23],
        image: "some updated image",
        in_service: false,
        manufacturer_name: "some updated manufacturer_name",
        name: "some updated name",
        Prepair: "some updated Prepair",
        original: false,
        parts: "some updated parts",
        profile: "some updated profile",
        reference: "some updated reference",
        serial_number: "some updated serial_number",
        start_year: ~D[2023-06-23],
        user: "some updated user",
        user_manual: "some updated user_manual",
        warranty_duration: 43
      }

      assert {:ok, %Product{} = product} = Data.update_product(product, update_attrs)
      assert product.bought_new == false
      assert product.category == "some updated category"
      assert product.country_of_origin == "some updated country_of_origin"
      assert product.date_of_purchase == ~D[2023-06-23]
      assert product.date_of_registrationn == ~D[2023-06-23]
      assert product.description == "some updated description"
      assert product.end_year == ~D[2023-06-23]
      assert product.image == "some updated image"
      assert product.in_service == false
      assert product.manufacturer_name == "some updated manufacturer_name"
      assert product.name == "some updated name"
      assert product.Prepair == "some updated Prepair"
      assert product.original == false
      assert product.parts == "some updated parts"
      assert product.profile == "some updated profile"
      assert product.reference == "some updated reference"
      assert product.serial_number == "some updated serial_number"
      assert product.start_year == ~D[2023-06-23]
      assert product.user == "some updated user"
      assert product.user_manual == "some updated user_manual"
      assert product.warranty_duration == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_product(product, @invalid_attrs)
      assert product == Data.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Data.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Data.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Data.change_product(product)
    end
  end

  describe "categories" do
    alias Prepair.Data.Category

    import Prepair.DataFixtures

    @invalid_attrs %{average_lifetime: nil, image: nil, name: nil, Prepair: nil, product: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Data.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Data.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{
        average_lifetime: 42,
        image: "some image",
        name: "some name",
        Prepair: "some Prepair",
        product: "some product"
      }

      assert {:ok, %Category{} = category} = Data.create_category(valid_attrs)
      assert category.average_lifetime == 42
      assert category.image == "some image"
      assert category.name == "some name"
      assert category.Prepair == "some Prepair"
      assert category.product == "some product"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()

      update_attrs = %{
        average_lifetime: 43,
        image: "some updated image",
        name: "some updated name",
        Prepair: "some updated Prepair",
        product: "some updated product"
      }

      assert {:ok, %Category{} = category} = Data.update_category(category, update_attrs)
      assert category.average_lifetime == 43
      assert category.image == "some updated image"
      assert category.name == "some updated name"
      assert category.Prepair == "some updated Prepair"
      assert category.product == "some updated product"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_category(category, @invalid_attrs)
      assert category == Data.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Data.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Data.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Data.change_category(category)
    end
  end
end
