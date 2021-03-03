#lang racket/base
;; ---------------------------------------------------------------------------------------------------

(require
 racket/contract
 racket/match
 (for-syntax racket/base))

;; ---------------------------------------------------------------------------------------------------

(define (gen-releases port)
  (let lp ()
    (let ([datum (read port)])
      (unless (eof-object? datum)
        (match datum
          [(list defrelease name author gh-url description)
           (printf "* `~a` ([pkg](https://pkgs.racket-lang.org/package/~a)/[src](~a)) ~a, by ~a.~n"
                   name name gh-url description author)]
          [_ (error "unreadable input")])
        (lp)))))

(module+ main

  (require racket/cmdline)

  (define release-file
    (command-line
     #:program "gen-releases"
     #:args (filename) ; expect one command-line argument: <filename>
     ; return the argument as a filename to compile
     (unless (file-exists? filename)
       (error "file ~a not found" filename))
     filename))

  (call-with-input-file release-file gen-releases))

