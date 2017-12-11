#!/bin/bash
hash=$RANDOM
output_words="__words.$hash.txt"
output_filtered="__filtered.$hash.txt"

cat $@ |
grep -v '^[0-9]' |
sed 's/[?!.|]/ /g' |
sed 's/ * / /g' |
sed "s/[^A-Za-z\' ]//g" |
sed 's/^ //g' |
sed 's/ /\n/g' |
sed '/^$/d' |
sed -e 's/\(.*\)/\L\1/' |
sort -u |
sed -e 's/^[\t]*//' |
cat > "$output_words"

words=`cat "$output_words"`
touch "$output_filtered"

for i in $words; do
	echo -n "$i "
	read
	if [[ "$REPLY" == *"1"* ]]; then
		echo -e "$i\r\n" >> "$output_filtered"
	fi
done
