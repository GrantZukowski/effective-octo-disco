defmodule DogBreedsWeb.DogController do
  use DogBreedsWeb, :controller

  alias DogBreeds.Breeds
  alias DogBreeds.Breeds.Dog

  def index(conn, _params) do
    dog = Breeds.list_dog()
    render(conn, "index.html", dog: dog)
  end

  def new(conn, _params) do
    changeset = Breeds.change_dog(%Dog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dog" => dog_params}) do
    IO.inspect(dog_params)


    File.cp(dog_params["photo"].path, "images/#{dog_params["photo"].filename}")


    case Breeds.create_dog(dog_params) do
      {:ok, dog} ->
        conn
        |> put_flash(:info, "Dog created successfully.")
        |> redirect(to: Routes.dog_path(conn, :show, dog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dog = Breeds.get_dog!(id)
    render(conn, "show.html", dog: dog)
  end

  def edit(conn, %{"id" => id}) do
    dog = Breeds.get_dog!(id)
    changeset = Breeds.change_dog(dog)
    render(conn, "edit.html", dog: dog, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dog" => dog_params}) do
    dog = Breeds.get_dog!(id)

    case Breeds.update_dog(dog, dog_params) do
      {:ok, dog} ->
        conn
        |> put_flash(:info, "Dog updated successfully.")
        |> redirect(to: Routes.dog_path(conn, :show, dog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dog: dog, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dog = Breeds.get_dog!(id)
    {:ok, _dog} = Breeds.delete_dog(dog)

    conn
    |> put_flash(:info, "Dog deleted successfully.")
    |> redirect(to: Routes.dog_path(conn, :index))
  end
end
