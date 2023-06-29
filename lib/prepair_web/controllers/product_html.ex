defmodule PrepairWeb.ProductHTML do
  use PrepairWeb, :html

  embed_templates "product_html/*"

  @doc """
  Renders a product form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def product_form(assigns)

  defp category_opts(changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:categories, [])
      |> Enum.map(& &1.data.id)

    for cat <- Prepair.Data.list_categories(),
        do: [key: cat.name, value: cat.id, selected: cat.id in existing_ids]
  end
end
