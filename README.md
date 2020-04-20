# Rena

To start your Phoenix server:

  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

### Running using Docker

Development enviroment

```
sudo docker-compose build
sudo docker-compose up
```

### Resetting Docker containers

To start from a clean slate, CTRL C the terminal where you inputted `sudo docker-compose up` and:

```
sudo docker container prune
sudo docker volume prune
sudo docker network prune
```

This removes the container, volumes, and networks.

## Running mix commands

To see running containers and their id which is required in the next step

```
sudo docker ps
```

Enable interactive shell

```
sudo docker exec -it CONTAINER ID /bin/bash
```

## Running credo

```
mix credo
```