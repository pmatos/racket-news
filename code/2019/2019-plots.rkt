#lang racket/base

(require plot
         threading
         racket/list
         racket/string)

(define (plot-data name raw-data)
  (define data
    (let ([l (filter non-empty-string? (regexp-split #px"[[:cntrl:]]+" raw-data))])
      (for/list ([i (in-list l)]
                 [index (in-range 1 (+ 1 (length l)))])
        (define spl (string-split i))
        (list index
              (string->number (second spl))
              (map string->number (string-split (third spl) "/"))
              (map string->number (string-split (fourth spl) "/"))))))
  (define commits-data
    (map (lambda (i) (list (first i) (second i))) data))
  (define issue-data
    (map (lambda (i) (cons (first i) (third i))) data))
  (define pr-data
    (map (lambda (i) (cons (first i) (fourth i))) data))

  (list 
   (parameterize ([plot-x-label "Month"]
                  [plot-x-ticks (linear-ticks #:number 12)]
                  [plot-y-ticks (linear-ticks)]
                  [plot-x-far-ticks no-ticks]
                  [plot-y-far-ticks no-ticks]
                  [plot-y-label "# Commits"])
     (plot (list (lines commits-data #:color 3)
                 (points commits-data #:color 1 #:line-width 2))
           #:title (format "racket/~a #Commits" name)
           #:y-min 0))

   (parameterize ([plot-x-label "Month"]
                  [plot-x-ticks (linear-ticks #:number 12)]
                  [plot-y-ticks (linear-ticks)]
                  [plot-x-far-ticks no-ticks]
                  [plot-y-far-ticks no-ticks]
                  [plot-y-label "# Issues"])
     (plot (list
            (lines (for/list ([d (in-list issue-data)])
                     (list (first d) (second d)))
                   #:color 1
                   #:label "New")
            (lines (for/list ([d (in-list issue-data)])
                     (list (first d) (third d)))
                   #:color 2
                   #:label "Closed")
            (lines (for/list ([d (in-list issue-data)])
                     (list (first d) (fourth d)))
                   #:color 3
                   #:label "Open"))
           #:title (format "racket/~a Issues" name)
           #:y-min 0))
   
   (parameterize ([plot-x-label "Month"]
                  [plot-x-ticks (linear-ticks #:number 12)]
                  [plot-y-ticks (linear-ticks)]
                  [plot-x-far-ticks no-ticks]
                  [plot-y-far-ticks no-ticks]
                  [plot-y-label "# PRs"])
     (plot (list
            (lines (for/list ([d (in-list pr-data)])
                     (list (first d) (second d)))
                   #:label "New"
                   #:color 1)
            (lines (for/list ([d (in-list pr-data)])
                     (list (first d) (third d)))
                   #:color 2
                   #:label "Closed")
            (lines (for/list ([d (in-list pr-data)])
                     (list (first d) (fourth d)))
                   #:color 3
                   #:label "Open"))
           #:title (format "racket/~a PRs" name)
           #:y-min 0))))
   
(define racket-data/raw "
Jan 137 7/7/260 6/10/77
Feb 118 18/14/263 34/34/80
Mar 149 37/23/278 29/23/86
Apr 98 34/21/294 29/22/88 
May 127 19/17/298 15/18/89
Jun 147 22/9/310 21/18/91
Jul 99 29/26/316 31/31/93
Aug 35 20/11/322 10/12/94
Sep 62 20/14/329 15/14/95
Oct 119 23/13/343 21/19/98
Nov 95 31/28/354 30/25/101
Dec 106 25/25/359 22/22/104")

(plot-data "racket" racket-data/raw)

(define chez-data/raw "
Jan 49
Feb 20
Mar 40
Apr 29
May 11
Jun 26
Jul 21
Aug 0
Sep 12
Oct 8
Nov 6
Dec 17")

(define chez-data
  (let ([l (filter non-empty-string? (regexp-split #px"[[:cntrl:]]+" chez-data/raw))])
    (for/list ([i (in-list l)]
               [index (in-range 1 (+ 1 (length l)))])
      (define spl (string-split i))
      (list index (string->number (second spl))))))

(parameterize ([plot-x-label "Month"]
               [plot-y-label "# Commits"]
               [plot-x-ticks (linear-ticks #:number 12)]
               [plot-x-far-ticks no-ticks]
               [plot-y-far-ticks no-ticks])
  (plot (list (lines chez-data #:color 3)
              (points chez-data #:color 1 #:line-width 2))
        #:title "racket/ChezScheme #Commits"))

(define typed-racket-data/raw "
Jan 3 2/0/191 3/3/9
Feb 6 5/0/194 7/4/9
Mar 5 5/3/198 2/2/10
Apr 3 0/0/198 3/2/10
May 5 3/1/199 3/3/10
Jun 9 5/4/201 4/3/11
Jul 29 4/4/203 7/10/11
Aug 11 4/2/206 7/7/11
Sep 5 4/5/209 4/5/12
Oct 4 1/1/209 3/0/13
Nov 15 7/1/214 7/6/13
Dec 22 1/2/215 12/14/15")

(plot-data "typed-racket" typed-racket-data/raw)

(define drracket-data/raw "
Jan 4 3/1/108 1/1/3 
Feb 4 3/1/111 0/0/3
Mar 2 4/1/114 1/1/3
Apr 2 4/1/116 1/1/3
May 3 4/2/118 0/0/3
Jun 1 6/0/123 0/0/3 
Jul 9 5/3/127 2/4/3 
Aug 6 17/5/141 0/0/3
Sep 2 4/1/144 0/0/3
Oct 5 11/0/155 0/0/3
Nov 12 3/0/158 2/1/4
Dec 20 6/2/162 1/0/4")

(plot-data "drracket" drracket-data/raw)