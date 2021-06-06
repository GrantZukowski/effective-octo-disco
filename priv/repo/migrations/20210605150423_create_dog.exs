defmodule DogBreeds.Repo.Migrations.CreateDog do
  use Ecto.Migration

  def change do
    create table(:dog) do
      add :name, :string
      add :body, :text

      timestamps()
    end
  end
end
