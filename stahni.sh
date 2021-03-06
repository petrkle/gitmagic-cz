#!/bin/bash

set -e

IFS='
'
OUT=html

[ -d $OUT ] || mkdir $OUT

for foo in `cat url`
do
	URL=`echo $foo | cut -d" " -f1`
	FILE=`echo $foo | cut -d" " -f2`
	wget -qO $OUT/$FILE.html $URL
	sed -i "s/\r//g" $OUT/$FILE.html
done
