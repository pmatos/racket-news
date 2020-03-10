#! /bin/bash

for html in `find public -name '*.html'`; do
    fpath=`echo $html | cut -d '/' -f2-`
    url="https://racket-news.com/$fpath"
    json="{ \"snapshotURL\": \"$url\" }"
    response=$(curl -s -H "Content-Type: application/json" --request POST --data "$json" https://dawn-rain-4cff.bkardell.workers.dev/)
    echo "Remembering $url"
    echo "    Response: $response"
done
