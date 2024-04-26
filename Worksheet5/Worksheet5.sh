#!/bin/bash

mkdir -p "Worksheet5/United States/"

while read line; do
	category=$(echo $line | awk -F ',' '{print $5}')
	country=$(echo $line | awk -F ',' '{print $8}')
	if [ "$country" = "United States" ]; then
		echo "$line" >> "Worksheet5/United States/$category.txt"
fi
done < 'Global YouTube Statistics.csv'

all_line_counts=""

for category_file in "Worksheet5/United States/"*.txt; do
	category=$(basename "$category_file" .txt)
	line_count=$(wc -l < "$category_file")
	all_line_counts+="Category: $category, Line Count: $line_count"$'\n'
done

echo "$all_line_counts" > "Worksheet5/ws5.txt"
