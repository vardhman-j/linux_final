filename=web-server.log
search_term='" 200 '
status_code="200"

# count=$(grep -o "$search_term" "$filename" | wc -l)

# echo "The count of $status_code is $count."

# Alternate way
count=$(awk '{print $9}' "$filename"| grep -w "200" | wc -l)
echo "Count of HTTP Status code 200 is $count"