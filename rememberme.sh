#! /bin/bash -x

i=0
for html in `find public -name '*.html'`; do
    i=$(( i + 1 ))
    if [[ $i == 15 ]]; then
	i=0
	sleep 60
    fi
    fpath=`echo $html | cut -d '/' -f2-`
    url="https://racket-news.com/$fpath"
    response=$(curl -s --request GET https://web.archive.org/save/$url | tail -n 7 | head -n 2)
    echo "Remembering $url"
    echo "    Response: $response"
done
