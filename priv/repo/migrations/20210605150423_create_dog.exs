defmodule DogBreeds.Repo.Migrations.CreateDog do
  use Ecto.Migration

  def change do
    create table(:dog) do
      add :name, :string
      add :body, :text

      timestamps()
    end

    create table(:image) do
      add :url, :string
      add :dog_id, references(:dog, on_delete: :delete_all)

      timestamps()
    end
  end
end
