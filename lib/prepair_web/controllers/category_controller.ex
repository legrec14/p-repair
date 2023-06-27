defmodule PrepairWeb.CategoryController do
  use PrepairWeb, :controller

  alias Prepair.Data
  alias Prepair.Data.Category

  def index(conn, _params) do
    categories = Data.list_categories()
    render(conn, :index, categories: categories)
  end

  def new(conn, _params) do
    changeset = Data.change_category(%Category{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    case Data.create_category(category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: ~p"/categories/#{category}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category =
      id
      |> Data.get_category!()

    render(conn, :show, category: category)
  end

  def edit(conn, %{"id" => id}) do
    category = Data.get_category!(id)
    changeset = Data.change_category(category)
    render(conn, :edit, category: category, changeset: changeset)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Data.get_category!(id)

    case Data.update_category(category, category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: ~p"/categories/#{category}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, category: category, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Data.get_category!(id)
    {:ok, _category} = Data.delete_category(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: ~p"/categories")
  end
end
