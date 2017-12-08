#!/bin/bash
cat series1/* series2/* |
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
tee all_words.txt
