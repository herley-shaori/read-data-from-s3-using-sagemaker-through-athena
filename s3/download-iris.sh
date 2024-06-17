#!/bin/bash

# URL of the iris.csv file
DOWNLOAD_URL="https://raw.githubusercontent.com/uiuc-cse/data-fa14/gh-pages/data/iris.csv"

# Name of the file to save
FILE_NAME="iris.csv"

# Download the iris.csv file
curl -o ${FILE_NAME} ${DOWNLOAD_URL}

echo "Downloaded ${FILE_NAME} from ${DOWNLOAD_URL}"