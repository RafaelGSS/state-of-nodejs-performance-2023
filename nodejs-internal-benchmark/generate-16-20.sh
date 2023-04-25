#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 benchmark_namespace (e.g fs)"
    exit 1
fi

old_csv_file="compare-$1-16-18.csv"
new_csv_file="compare-$1-18-20.csv"
output_csv_file="compare-$1-16-20.csv"

awk -F '","' -v FS='","' '
    FNR==NR {
        if ($1 == "\"old") a[FNR] = $0
        next
    }
    {
        if ($1 == "\"old") print a[FNR]
        else print
    }
' "$old_csv_file" "$new_csv_file" > $output_csv_file

echo "Updated file saved to $output_csv_file"
