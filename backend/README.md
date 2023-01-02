## Introduction

#### Starting the database

> Tip: Make sure you have Golang installed.

1. Install Docker on your machine. See documentation [Docker documentation](https://docs.docker.com/engine/install/ubuntu/)

2. Install the Postgres and Redis Images

```bash
docker pull postgres
docker pull redis
```

3. Create a container from the Postgres Image

```bash

$   docker run --name postgres -e POSTGRES_HOST_AUTH_METHOD=trust -v pgdata:/var/lib/postgresql/data -p 5432:5432 -d postgres/postgres

```

4. Create a database in the newly created Postgres container

```bash
 docker exec -it postgres sh
  $ su - postgres
  $ psql
  $ postgres=# create database yozaclean_dev;
  $ postgres=# create database yozaclean_test;
  $ postgres=#
```

5. Install redis

```bash
docker run --name redis -p 6379:6379 -d redis:alpine

```

6. Add environment variables

Copy the `.env.example` file and replace with the right values from Gitlab CI environment variables

```bash
 cp .env.example .env

```

7. Install dependencies

```bash
go get

```

8.  Running tests

You can run tests without the need to compile first using

```bash
go test
```
