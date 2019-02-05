.PHONY: site

site:
	raco frog -b
	cp -Rv js/ css/ site/
	cp img/favicon.png site/
	cp img/racket-news-500w.png site/logo.png
	echo 'racket-news.com' > site/CNAME
