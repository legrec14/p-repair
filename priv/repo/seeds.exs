# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Prepair.Repo.insert!(%Prepair.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
for name <- ["Lave-linge (hublot)", "Lave-linge(top)", "Aspirateur"] do
  {:ok, _} = Prepair.Data.create_category(%{name: name})
end
