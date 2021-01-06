#lang racket/base
; A poorly written script to get data to plot for the 2020 review of racket in RN

(require racket/class
         plot/pict
         threading
         racket/list
         racket/string
         pict
         2htdp/batch-io)

(define (save-pict pict path)
  (define bm (pict->bitmap pict))
  (send bm save-file path 'png))

(define (get-commits s)
  ; return a list ((1 X) (2 Y) ... (12 Z))
  ; of commits per month from s
  ; Commit lines start with "^# Commits: "
  (define lines (string-split s "\n"))
  (define vs
    (for/list ([l (in-list lines)]
               #:when (string-prefix? l "# Commits:"))
      (string->number (string-trim (second (string-split l ":"))))))
  (map list (range 1 (+ 1 (length vs))) vs))

(define (get-issues s pre)
  ; return a list ((1 (X1 X2 X3)) (2 (Y1 Y2 Y3)) ... (12 (Z1 Z2 Z3))
  ; Issues lines start with pre
  (define lines (string-split s "\n"))
  (define vs
    (for/list ([l (in-list lines)]
               #:when (string-prefix? l pre))
      (map (compose string->number string-trim)
           (string-split (second (string-split l ":")) "/"))))
  (map cons (range 1 (+ 1 (length vs))) vs))

(define (file->data f)
  (with-input-from-file f
    (lambda ()
      (define s (read-file 'stdin))
      (values (get-commits s)
              (get-issues s "Issues:")
              (get-issues s "PRs:")))
    #:mode 'text))

(define (plot-data name f)
  (define-values (commits-data issue-data pr-data)
    (file->data f))

  (hc-append
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

(for ([repo (in-list '(drracket plot racket redex scribble typed-racket))])
  (printf "generating ~a.png~n" repo)
  (save-pict (plot-data repo (string-append "plot-data/" (symbol->string repo) ".txt"))
             (format "~a.png" repo)))