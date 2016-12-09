# Learning PHP 7
Packt publishing course web application code

## Requirements

- [Composer](https://getcomposer.org/)
- [Docker] (https://docs.docker.com/)
- [Docker compose](https://docs.docker.com/compose/install/).

## Running the code

- Update the dependencies with `composer update`.
- Run `docker-compose up` to start the Docker containers.
- Could be necessary to update the database schema(see below).
- Open the browser on the exposed Docker IP on port 8080 (usually http://localhost:8080, could be different based on your configuration).

### Update the database schema

- Run `docker ps` and get the name of the web container.
- Could be necessary to generate entities with `docker exec NAME_OF_CONTAINER vendor/bin/doctrine orm:generate-entities src/`.
- Update the schema with `docker exec NAME_OF_WEB_CONTAINER vendor/bin/doctrine orm:schema-tool:update --force`.
