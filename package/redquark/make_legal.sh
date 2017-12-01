#!/bin/bash

for f in `find output/legal-info/licenses -type f`
do
    echo
    echo
    echo "$f"
    echo "----------------------------------------"
    echo
    cat $f | sed -e 's///g' # Remove ^L
done
