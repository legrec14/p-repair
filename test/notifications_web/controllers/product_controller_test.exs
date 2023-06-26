defmodule PrepairWeb.ProductControllerTest do
  use PrepairWeb.ConnCase

  import Prepair.DataFixtures

  @create_attrs %{
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
  @update_attrs %{
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

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, ~p"/products")
      assert html_response(conn, 200) =~ "Listing Products"
    end
  end

  describe "new product" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/products/new")
      assert html_response(conn, 200) =~ "New Product"
    end
  end

  describe "create product" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/products", product: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/products/#{id}"

      conn = get(conn, ~p"/products/#{id}")
      assert html_response(conn, 200) =~ "Product #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/products", product: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Product"
    end
  end

  describe "edit product" do
    setup [:create_product]

    test "renders form for editing chosen product", %{conn: conn, product: product} do
      conn = get(conn, ~p"/products/#{product}/edit")
      assert html_response(conn, 200) =~ "Edit Product"
    end
  end

  describe "update product" do
    setup [:create_product]

    test "redirects when data is valid", %{conn: conn, product: product} do
      conn = put(conn, ~p"/products/#{product}", product: @update_attrs)
      assert redirected_to(conn) == ~p"/products/#{product}"

      conn = get(conn, ~p"/products/#{product}")
      assert html_response(conn, 200) =~ "some updated category"
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, ~p"/products/#{product}", product: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Product"
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, ~p"/products/#{product}")
      assert redirected_to(conn) == ~p"/products"

      assert_error_sent 404, fn ->
        get(conn, ~p"/products/#{product}")
      end
    end
  end

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end
end
