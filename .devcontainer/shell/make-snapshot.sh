#!/bin/bash
#
# This script extracts a page from the file main.pdf as an image, and sends it to Discord's channel.

INPUT_FILE=main.pdf

PAGE_NUM=$(($1 - 1))
LAST_PAGE_NUM=$(identify -format '%n\n' $INPUT_FILE |head -n1)

usage() {
	echo "Usage: $0 <PAGE NUMBER>"
	echo "\t Total pages: ${LAST_PAGE_NUM}"
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi

if (($PAGE_NUM < 0 || $PAGE_NUM >= $LAST_PAGE_NUM)); then
	usage
	exit 1
fi

convert -density 600 "main.pdf[${PAGE_NUM}]" -quality 600 jpg:- | convert -resize "%25x%25" jpg:- snapshot.jpg

