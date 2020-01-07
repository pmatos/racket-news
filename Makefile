.PHONY: site clean lgtm

site: clean
	raco frog -b
	cp -Rv js/ css/ public/
	cp img/favicon.png public/
	cp img/racket-news-500w.png public/logo.png
	cp -Rv img/issue21 public/img
	cp -Rv img/issue23 public/img
	find public/ -type f 

lgtm:
	git checkout production
	git merge --no-edit --no-ff master
	git push
	git checkout master

clean:
	rm -Rf public/

