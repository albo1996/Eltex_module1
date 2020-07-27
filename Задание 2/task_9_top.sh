#! /bin/bash

top_output=$(top -b -n 1 | tr -s [:blank:] | tail -n +7 | cut -f 2,3,10,11 -d ' ' | tr ' ' '\t')

echo "$top_output"
