.PHONY: site 
site: clean
	raco darwin -Vb
	cp -Rv js/ css/ public/
	cp img/favicon.png public/
	cp img/racket-news-500w.png public/logo.png
	cp -Rv img/ public/
	gzip -k -9 $(find public -type f)
	find public/ -type f 

.PHONY: clean
clean:
	rm -Rf public/

