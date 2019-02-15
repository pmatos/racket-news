.PHONY: site clean lgtm

site: clean
	raco frog -b
	cp -Rv js/ css/ site/
	cp img/favicon.png site/
	cp img/racket-news-500w.png site/logo.png
	echo 'racket-news.com' > site/CNAME

lgtm:
	git checkout production
	git merge --no-edit --no-ff master
	git push
	git checkout master

clean:
	rm -Rf site/

