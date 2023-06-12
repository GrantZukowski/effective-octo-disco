# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DogBreeds.Repo.insert!(%DogBreeds.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule DogBreeds.Seeds do
  alias DogBreeds.Repo
  alias DogBreeds.Breeds.Dog
  alias DogBreeds.Images.Image

  IO.inspect("running seeds")

  dogs = [
    %Dog{
      name: "Affenspinscher",
      image: %Image{url: "/images/affenpinscher.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Border Collie",
      image: %Image{url: "/images/border_collie.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Boxer",
      image: %Image{url: "/images/boxer.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Cocker Spaniel",
      image: %Image{url: "/images/cocker_spaniel.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "English Bulldog",
      image: %Image{url: "/images/english_bulldog.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Great Dane",
      image: %Image{url: "/images/great_dane.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Irish Terrier",
      image: %Image{url: "/images/irish_terrier.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Norwich Terrier",
      image: %Image{url: "/images/norwich_terrier.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Pomeranian",
      image: %Image{url: "/images/pomeranian.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    },
    %Dog{
      name: "Shetland Sheepdog",
      image: %Image{url: "/images/shetland_sheepdog.jpg", inserted_at: ~N[2021-06-05 15:04:23]}
    }
  ]

  Enum.each(dogs, fn dog -> Repo.insert!(dog) end)
end
