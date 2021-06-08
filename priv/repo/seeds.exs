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

  IO.inspect("running seeds")

  dogs = [
    %Dog{name: "boxer"},
    %Dog{name: "great dane"},
    %Dog{name: "cocker spaniel"},
    %Dog{name: "english bulldog"},
    %Dog{name: "irish terrier"},
    %Dog{name: "norwich terrier"},
    %Dog{name: "pomeranian"},
    %Dog{name: "shetland sheepdog"},
    %Dog{name: "border collie"}
  ]

  Enum.each(dogs, fn dog -> Repo.insert!(dog) end)
end
