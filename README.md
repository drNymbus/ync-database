# ync-database

This project aims to be able to deploy and manage easily any database in a kubernetes cluster. This was thought to explore any type (SQL, NoSQL, Graph, Vector) and database distros. Every database disro implemented has it's on `ync-<distro>` folder containing every file needed to configure the database and a Dockerfile to deploy it in a kubernetes environment. Among those folders lies: *`ync-job`*, a solution to run any script & commands agiainst a given database. This has been thought as to be able to modify a database on the go without having any downtime in production.

## ync-job

(To better understand how this works, the Dockerfile can be a great entrypoint.)
This is an all in one solution to scripts agains a given database distro.

- `installer.sh`: installs commands and dependency to be able to communicate/run scripts agains a database through bash.

- `ync-job.sh`: is the container entrypoint. It serves a job to run files (even folders) agains a given database.

- For each distro:
    - folders containing database distro scripts.
    - `job.sh`: the command ran to apply scripts to the database