#!/bin/bash

echo "Insert the name and the extension for the file you would like to create"
read FILENAME
MATCH=`ls | grep $FILENAME | wc -l`

if [[ $MATCH -gt 0 ]]; then
    echo "This file already exists"
else
    `touch $FILENAME`
fi

exit 0