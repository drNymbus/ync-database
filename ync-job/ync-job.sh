#!/bin/bash

# Initialize variables
dist_set=false
dist_type=""
files=()
folders=()
subjob=""
file_type=""

# Function to display an error and exit
usage() {
    echo "Usage: $0 --dist <type> <path/to/file_or_folder> [...]"
    exit 1
}

if [[ "$#" -lt 2 ]]; then
    echo "Error: Invalid number of arguments"
    usage
fi

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    if [[ "$1" == "--dist" ]]; then
        dist_set=true
        shift
        dist_type="$1"
    elif [[ -d "$1" ]]; then
        folders+=("$1")
    elif [[ -f "$1" ]]; then
        files+=("$1")
    else
        echo "Error: Invalid argument $1"
        usage
    fi
    shift
done

# Check if --dist was provided
if ! $dist_set; then
    echo "Error: --dist argument is required."
    usage
fi

# Display parsed information
echo "Distribution type: $dist_type"
echo "Files: ${files[*]}"
echo "Folders: ${folders[*]}"

if [[ "$dist_type" == "mongo" || "$dist_type" == "mongodb" ]]; then
    subjob=mongodb/job.sh
    file_type="js"
elif [[ "$dist_type" == "cassandra" || "$dist_type" == "cassandradb" || "$dist_type" == "cql" ]]; then
    subjob=cql/job.sh
    file_type="cql"
fi

if [ ${#files[@]} -gt 0 ]; then
    for f in ${files[@]}; do
        $subjob $f
    done
fi

if [ ${#folders[@]} -gt 0 ]; then
    for fold in ${folders[@]}; do
        echo "$fold"
        for f in ${fold}/*.${file_type}; do
            echo "$f"
            if [[ ! -d "$f" ]]; then
                $subjob $f
            fi
        done
    done
fi

exit 0