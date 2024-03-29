defmodule DogBreeds.Breeds.Dog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dog" do
    field :body, :string
    field :name, :string

    timestamps()

    has_one :image, DogBreeds.Images.Image
  end

  @doc false
  def changeset(dog, attrs) do
    dog
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
