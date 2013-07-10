all:
	./stahni.sh
	./uprav.sh
	./spoj.sh
	kindlegen tmp/gm.html

clean:
	rm -rf html tmp
