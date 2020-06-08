.PHONY: site 
site: clean
	raco darwin -Vb
	cp -Rv js/ css/ public/
	cp img/favicon.png public/
	cp img/racket-news-500w.png public/logo.png
	cp -Rv img/issue21 public/img
	cp -Rv img/issue23 public/img
	cp -Rv img/issue25 public/img
	gzip -k -9 $(find public -type f)
	find public/ -type f 

.PHONY: clean
clean:
	rm -Rf public/

