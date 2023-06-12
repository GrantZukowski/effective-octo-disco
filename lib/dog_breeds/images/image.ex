defmodule DogBreeds.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "image" do
    belongs_to :dog, DogBreeds.Breeds.Dog
    field :url, :string

    timestamps()
  end

  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url])
    |> validate_required([:url, :dog_id])
    |> foreign_key_constraint(:dog_id)
  end
end
