.PHONY: site clean lgtm

site: clean
	raco frog -b
	cp -Rv js/ css/ public/
	cp img/favicon.png public/
	cp img/racket-news-500w.png public/logo.png
	mkdir -p public/img/issue21
	cp img/issue21/gamejam.gif public/img/issue21
	find public/ -type f 

lgtm:
	git checkout production
	git merge --no-edit --no-ff master
	git push
	git checkout master

clean:
	rm -Rf public/

