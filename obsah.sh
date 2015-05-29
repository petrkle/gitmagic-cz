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
<ul>

' > $OUT/obsah.html

for foo in $OUT/gitmagic-*.html
do
	FILE=`basename $foo`
	TITLE=`grep '<title>' $foo | sed 's/.*\(GitMagic.*\)/\1/'`
	echo "<li><a href=\"$FILE\">$TITLE</a></li>" >> $OUT/obsah.html
done

echo '</ul></body>
</html>' >> $OUT/obsah.html
