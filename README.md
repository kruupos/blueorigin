== Blue Origins Teleporter

The year is 2092, people are using teleportation instead of taking planes, boats or cars.

* Ruby version: 2.2.3

* Rails version: 4.2.6

# Requierments

* Docker

* Docker-compose

# Setup

Clone this repository.
This app is running with `Docker`. In order to run the app launch the following command:

## Initialize volume and databases

```bash
docker volume create --name blueorigin-postgres
docker volume create --name blueorigin-redis
docker-compose run blueorigin rake db:reset db:migrate db:seed
```

## Run the app

```bash
docker-compose up
```

Then please go to [localhost](http://0.0.0.0:8000)

# Tests

To run the tests yourself, please do:

```bash
docker-compose run blueorigin rake rspec .
```

# How to use the app?

Please select your destination and your dates, click on `book` and enjoy your incomming teleportation!

