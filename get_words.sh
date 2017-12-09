#!/bin/bash
cat $@ |
grep -v '^[0-9]' |
sed 's/[?!.|]/ /g' |
sed 's/ * / /g' |
sed "s/[^A-Za-z\' ]//g" |
sed 's/^ //g' |
sed 's/ /\n/g' |
sed '/^$/d' |
sed -e 's/\(.*\)/\L\1/' |
sort |
uniq |
sort |
sed -e 's/^[\t]*//' |
cat > __words.txt

words=`cat __words.txt`

touch __filtered.txt

for i in $words; do
	echo -n "$i "
	read
	if [[ "$REPLY" == *"1"* ]]; then
		echo -e "$i\r\n" >> __filtered.txt
	fi
done
