Dog breeds app

You will need elixir, erlang, node, npm, and postgres (running) to run this application.

Use the normal up routine for an elixir application:

$ mix deps.get
$ mix deps.compile
$ cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development
$ cd ..
$ mix ecto.create
$ mix run priv/repo/seeds.exs
$ mix phx.server

For this application I chose to use Phoenix, Elixir, Postgres, and Live View.  I chose this framework
because it works together really well and is familiar to me.  Also, there is little to no javascript, so
everything is created in Elixir (except for templates etc.)  In terms of design, I wanted to treat this
as if it was a blog post.

Initially, I focused on getting the basic functionality of adding and editing a dog breed with a supported 
postgres backend database.  I was also interested in setting up a deploy pipeline, but decided to save that for later.

Once I got that done, I focused on the photo upload.  I decided to store the file locally for ease of use
which does work.  I went for the bonus feature first becuase I thought that was the most useful.

I did not associate the dog breeds with the photos yet, but both are stored, so the next step was to associate them
in the database so they could be displayed together.

To me what was most interesting was getting all the basic functionality of editing and uploading an image.  I also spent
time setting up the seeds file, so the page can be populated quickly by whatever developer needs to work on it.

### Features
- Backend API that serves:
    - A list of available dog breeds based on those available in `/images`
    - Individual dog images by breed
- Frontend UI that provides:
    - A list of dog breeds
    - The ability to choose a breed and display the image for it
- Bonus Feature:
  - Ability to add a new breed with a new image
