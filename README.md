# ync-database

This part is to explore all different types of databases; The initialization flow is thought to deploy a database and expanding incrementally through jobs and predefined routines. One directory contains database intializer scripting: `ync-job`. All other are database configurator, for every `ync-<database-distro>` directory.

For a more detailed description of deployment, see the readme file at `ync/deployment/README.md`.

## ync-job

For each distro available there is a directory associated to it. Each directory is able to initialize a specific database engine; a `Dockerfile` can be found in each of them to execute commands needed to run a routine that can be modified at running time. Each collection,keyspace,database ... (or whatever domination used), should be parted in differents directories and should specify the execution's order of scripts thanks to an indexing mechanism.

## ync-cassandra

The `Dockerfile` uses the `cassandra.yaml` as instructor for database initialization and `credentials.conf` is used to be able to connect to cqlsh without typing login information.

The remaining `.cql` files are executed after the database cluster is up and running.

    docker run -d -p 9042:9042 --name cassandra ync-cassandra

## ync-mongodb

Only a docker file is needed to set up an initial admin login.

    docker run -d -p 27017:27017 --name mongodb ync-mongodb

## Storage spaces

### store

This component aims to store anything needed to keep track of a user's basket and commands passed by users. The 'store' __keyspace__ will track what a user has put in his basket and what command.s he made:

- `store.Session`: a table to identify each existing session in a store.
- `store.Basket`: all information about the user's basket.
- `store.Command`: all informations the user has sent us to deliver the package.
- `store.Item`: every item that has been and is currently available in the store.

