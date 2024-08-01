# Liquibase and Docker

In order to run migrations with Liquibase alone, you need Java installed. This is an attempt to run Liquibase in Docker

## Prequisites

- Node 18
- Docker
- PostgreSQL

## Installation

```
npm i
```

## Run migrations

You first have to build the docker image. Make sure Docker is running before you run these commands

```
npm run migrate:build
```

Then you can run the migrations

```
npm run migrate:up
```

There is one caveat though, if you are trying to run the project locally and you have a local instance of PostgreSQL. Then you have to use `host.docker.internal` instead of `localhost` for the `DATABASE_HOST`. This is because the migration is run inside a container. I have put an if statement in the entrypoint bash script that says if the `DATABASE_HOST` is `localhost` change the `DATABASE_HOST` to `host.docker.internal`.

I also tried the same using a Dockerised version of PostgreSQL and it worked.
