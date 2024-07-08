filename=web-server.log

pattern='HTTP/1.1" [0-9]*'

#grep -o "$pattern" "$filename" | sort | uniq -c

hashmap=$(awk '{print $9}' "$filename" | sort | uniq -c)

echo "Formatted Output:"
echo "$hashmap" | awk '{print "Count of HTTP Status code",$2, "is", $1}'