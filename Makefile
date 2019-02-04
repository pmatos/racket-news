.PHONY: site

site:
	raco frog -b
	cp -Rv js/ css/ site/
	cp img/favicon.png site/
	echo 'racket-news.com' > site/CNAME
