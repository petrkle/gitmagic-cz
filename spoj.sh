#!/bin/bash

set -e

OUT=tmp

echo '<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="Content-Language" content="cs" />
	<title>GitMagic</title>
</head>
<body>
<h1>GitMagic</h1>
' > $OUT/gm.html

for foo in $OUT/gitmagic-*.html
do
	cat $foo | \
	sed /'<html>'/,/'<body>'/d |\
	sed /'<\/body>'/,/'<\/html>'/d \
		>> $OUT/gm.html
done

echo '</body>
</html>' >> $OUT/gm.html
