git-magic-cz.mobi: gm.opf tmp/obsah.html
	kindlegen -o git-magic-cz.mobi gm.opf

tmp/obsah.html:
	./stahni.sh
	./uprav.sh
	./obsah.sh

clean:
	rm -rf html tmp *.mobi
