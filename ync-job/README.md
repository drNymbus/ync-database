# ync-job

This is a project to run commands automatically against any given database. For each distro a "job.sh" file will be ran to execute the commands.

## Distros
### CQL

The "cqlsh" is ran along with the "-f" option.

### MongoDB

The "mongosh" is ran, files to be read are given thanks to the unix '<' command.

## installer.sh

This bash script is there to install every command needed to communicate with the desired database.

## ync-job.sh

This is the entrypoitn script, only one argument is mandatory: "--distro", this is to specify the database distribution. Then any given folder or file will be given to the distribution 'job.sh' file