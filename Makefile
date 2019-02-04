.PHONY: site

site:
	raco frog -b
	cp -Rv js/ css/ site/
	cp img/favicon.png site/
