#!/bin/bash

usage() {
	echo "Usage: $0 <WEBHOOK URL>"
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi

curl -F "file1=@snapshot.jpg" $1