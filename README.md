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

Then you can migrate the database

```
npm run migrate:up
```
