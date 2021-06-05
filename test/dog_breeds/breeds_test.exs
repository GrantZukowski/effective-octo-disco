defmodule DogBreeds.BreedsTest do
  use DogBreeds.DataCase

  alias DogBreeds.Breeds

  describe "dog" do
    alias DogBreeds.Breeds.Dog

    @valid_attrs %{body: "some body", name: "some name"}
    @update_attrs %{body: "some updated body", name: "some updated name"}
    @invalid_attrs %{body: nil, name: nil}

    def dog_fixture(attrs \\ %{}) do
      {:ok, dog} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Breeds.create_dog()

      dog
    end

    test "list_dog/0 returns all dog" do
      dog = dog_fixture()
      assert Breeds.list_dog() == [dog]
    end

    test "get_dog!/1 returns the dog with given id" do
      dog = dog_fixture()
      assert Breeds.get_dog!(dog.id) == dog
    end

    test "create_dog/1 with valid data creates a dog" do
      assert {:ok, %Dog{} = dog} = Breeds.create_dog(@valid_attrs)
      assert dog.body == "some body"
      assert dog.name == "some name"
    end

    test "create_dog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Breeds.create_dog(@invalid_attrs)
    end

    test "update_dog/2 with valid data updates the dog" do
      dog = dog_fixture()
      assert {:ok, %Dog{} = dog} = Breeds.update_dog(dog, @update_attrs)
      assert dog.body == "some updated body"
      assert dog.name == "some updated name"
    end

    test "update_dog/2 with invalid data returns error changeset" do
      dog = dog_fixture()
      assert {:error, %Ecto.Changeset{}} = Breeds.update_dog(dog, @invalid_attrs)
      assert dog == Breeds.get_dog!(dog.id)
    end

    test "delete_dog/1 deletes the dog" do
      dog = dog_fixture()
      assert {:ok, %Dog{}} = Breeds.delete_dog(dog)
      assert_raise Ecto.NoResultsError, fn -> Breeds.get_dog!(dog.id) end
    end

    test "change_dog/1 returns a dog changeset" do
      dog = dog_fixture()
      assert %Ecto.Changeset{} = Breeds.change_dog(dog)
    end
  end
end
