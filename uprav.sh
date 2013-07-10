#!/bin/bash

set -e

OUT=tmp

[ -d $OUT ] || mkdir $OUT

for foo in html/*.html
do
	FILE=`basename $foo .html`
	TITLE=`grep "<h2>" $foo | head -1 | sed "s/.*<h2>//;s/<\/h2>.*//"`

	cat $foo | \
	sed /'.*<meta name.*'/d | \
	sed /'<?xml version="1.0" encoding="UTF-8"?>'/d | \
	sed /'<!DOCTYPE html PUBLIC'/d | \
	sed 's/<hr class="grey" \/>//g' | \
	sed "s/<title>.*<\/title>/<title>$TITLE<\/title>/" | \
	sed 's/<body id="body">/<body>/g' | \
	sed 's/<p class="zvyrazneni">/<p>/g' | \
	sed 's/<p><p>/<p>/g' | \
	sed 's/<html xmlns="http:\/\/www.w3.org\/1999\/xhtml">/<html>/g' | \
	sed /'<div class="container"'/,/'<div class="html">'/d |\
	sed /'<p><strong>'/,/'<\/script>'/d |\
	sed /'.*<script type.*'/d | \
	sed /'.*<link.*'/d |\
	sed /'<!-- (C)'/,/'<\/div>'/d \
		> $OUT/$FILE.html
done
