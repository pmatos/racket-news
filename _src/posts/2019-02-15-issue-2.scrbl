#lang scribble/manual

Title: Racket News - Issue 2
Date: 2019-02-15T08:00:00

Welcome to the second issue of @hyperlink["https://www.racket-lang.org"]{Racket} News. Thanks for Greg Trzeciak's contributions to the issue. I will add a new section to the newsletter with the issue's contributors. If there's something you really dislike, or something you want to see added to the newsletter please @hyperlink["mailto:pmatos@linki.tools"]{send me an email} or @hyperlink["https://github.com/racket-news/racket-news.github.io-src/issues"]{submit an issue}.

I have setup a newsletter through @hyperlink["https://mailchimp.com"]{mailchimp} that you can register to from the @hyperlink["https://racket-news.com"]{main page} if you prefer to get all the issues straight into your mailbox. There are a few issues with the online CSS and fonts which I need to do some searching/learning to solve - Apologies for that. 

@section[#:style 'unnumbered]{What's New?}

@itemlist[
@item{@bold{@hyperlink["https://school.racket-lang.org/"]{Racket School 2019}} has been announced. With two tracks to choose from: @italic{How to design languages} and @italic{Beautiful Racket workshop} by Racket heavyweights, it's time to register. It'll happen just before @hyperlink["https://con.racket-lang.org"]{RacketCon}, on July 13-14.}
@item{On the mailing list @hyperlink["https://groups.google.com/d/msg/racket-users/SmdgFe4nnfU/LIbSra1_GQAJ"]{Little language design/implementation guidance}: Stephen De Gabrielle started an interesting thread on language design that is definitely worth some time.}
@item{Also on the mailing list @hyperlink["https://groups.google.com/d/msg/racket-users/N3Ke2ORZZ_Q/dsuDVq1vFwAJ"]{Python's append vs Racket's append and helping novices understand the implications}: Alex Harsanyi started this thread which mixes a lot of Python, Racket and how to introduce Racket to Pythonistas. Many interesting links come out of it:
	   @itemlist[
	   @item{@hyperlink["https://www.draketo.de/py2guile"]{Python to Guile book} by Arne Babenhauserheide}
	   @item{@hyperlink["https://github.com/racket/racket/wiki/Python-to-Racket"]{Python to Racket} on the Racket Wiki started by Stephen de Gabrielle}
	   @item{@hyperlink["https://benchmarksgame-team.pages.debian.net/benchmarksgame/faster/racket-python3.html"]{Racket vs Python3} on the Benchmarks game}
	   ]}
]

@section[#:style 'unnumbered]{Upcoming Meetups}

@itemlist[
	@item{@hyperlink["http://bobkonf.de/2019/"]{BOB2019} - Right before Racketfest, also in Berlin, Germany there will be a few Rackety related things going on like a talk by @hyperlink["https://bobkonf.de/2019/krishnamurthi.html"]{Shriram Krishnamurthi} and a tutorial by @hyperlink["https://bobkonf.de/2019/alama.html"]{Jesse Alama}}
	@item{@hyperlink["https://racketfest.com/"]{RacketFest} - Jesse Alama is organizing the first European Racket Meeting. It will take place in Berlin, Germany on March 23, 2019. Make sure you get your ticket before they sell out... again!}
	@item{@hyperlink["https://school.racket-lang.org/"]{Racket School 2019} - taught by Racket heavyweights it's your time to get you #lang-fu up to scratch. Will take place in Salt Lake City, US on July 13-14.}
]

@section[#:style 'unnumbered]{Racket around the web}

Here is a post on exceptions implementation and a few videos for you today. Grab a cup of coffee (or your favourite beverage) and dig in.
@itemlist[
@item{@hyperlink["https://www.kimsereylam.com/lisp/racket/2019/01/30/implementing-exceptions-with-continuations-racket-lisp.html"]{Implementing Exceptions With Continuations Racket Lisp}, by Kimserey Lam}
@item{@hyperlink["https://media.ccc.de/v/35c3-9800-how_to_teach_programming_to_your_loved_ones"]{How to teach programming to your loved ones}, by Michael Sperber}
@item{@hyperlink["https://fosdem.org/2019/schedule/event/jsonwhendsl/"]{Why JSON when you can DSL? Your problematics deserve their own language}, by Jérôme Martin at FOSDEM2019}
@item{@hyperlink["https://fosdem.org/2019/schedule/event/guileracket/"]{A Guiler's Year of Racket}, by Christopher Webber at FOSDEM2019}
@item{@hyperlink["https://fosdem.org/2019/schedule/event/fractalideandcantor/"]{Fractalide and Cantor A Racket application built with Flow-Based Programming}, by Claes Wallin at FOSDEM2019}
@item{@hyperlink["https://fosdem.org/2019/schedule/event/makeownlangracket/"]{Make your own language with Racket. A kickstart workshop for the creative minds}, by Jérôme Martin at FOSDEM2019}
]

@section[#:style 'unnumbered]{Project on the Spotlight}

@verbatim{raco pkg install rosette}

This week I would like to feature @hyperlink["https://docs.racket-lang.org/rosette-guide/"]{Rosette}, a solver-aided programming system.

In simple terms, Rosette integrates a constraint solver into your favourite programming language and makes a language out of it. Do you know those fruit salad brain teasers that leave you hungrier but not so teased?

Yes, these...
@image["img/issue2/fruit-teaser.png"]

Don't waste time with them unless you want to use them to have some Rosette fun:

@codeblock|{
#lang rosette/safe

(define-symbolic apple integer?)
(define-symbolic banana integer?)
(define-symbolic grape integer?)
(define-symbolic question-mark integer?)

(assert (= (+ apple apple apple) 120))
(assert (= (+ apple banana banana) 100))
(assert (= (+ banana grape apple) 105))

(solve (assert (= (+ banana grape) question-mark)))
}|

@codeblock|{
> (model
   [apple 40]
   [banana 30]
   [grape 35]
   [question-mark 65])
}|

This is an incredibly interesting project with endless applications, besides being an excellent showcase of Racket's ability to create new languages with different evaluation models.

@section[#:style 'unnumbered]{Help Needed}

Do you know a project looking for contributors? I would love to hear about it.

@itemlist[
@item{@hyperlink["https://racket-news.com"]{Racket News}: Besides the obvious, @italic{What would you like to see next?} I could use a hand to make suggestions with regards to the website design. Using Frog with the Clean blog bootstrap4 theme but I am definitely way out of my league as soon as I need to do any CSSy stuff.}
@item{@hyperlink["https://github.com/LinkiTools/ChezScheme-RISCV/"]{Chez on RISC-V}: @hyperlink["https://www.eetimes.com/document.asp?doc_id=1334311#"]{RISC-V is on the verge of broad adoption} and I would like to see Racket running on RISC-V asap. That means getting Chez on RISC-V... if you are interested in compilers, architectures, and Racket, join in the fun.}
]

@section[#:style 'unnumbered]{Stats of mention}

Because Github pulse does not provide bi-weekly stats and because Racket's Github API library @hyperlink["https://github.com/eu90h/racket-github-api/issues/4"]{has a pagination problem}, I didn't manage to get very detailed statistics for this issue, but here's what I have for the last two weeks:

@tabular[
'(("Number of master Commits:" "60")
  ("Bugs open"                "288")
  ("PRs open"                  "92"))
]

Contributions by (3):
@itemlist[
@item{Matthew Flatt}
@item{Paulo Matos}
@item{Robby Findler}
]

@section[#:style 'unnumbered]{Jobs}

If you want to advertise any Racket related jobs, please @hyperlink["mailto:pmatos@linki.tools"]{send me an email} or @hyperlink["https://github.com/racket-news/racket-news.github.io-src/issues"]{submit an issue}.

@section[#:style 'unnumbered]{Contributors}

Thanks to:

@itemlist[
@item{Greg Trzeciak}
]

for his contributions to this issue.

@section[#:style 'unnumbered]{Disclaimer}

This issue is brought to you by @hyperlink["mailto:pmatos@linki.tools"]{Paulo Matos}. Any mistakes or inaccuracies are solely mine and
they do not represent the views of the @hyperlink["http://www.racket-lang.org/team.html"]{PLT team}, who develop Racket.

I have also tried to survey the most relevant things that happened in Racket lang recently. If you have done something awesome, wrote a blog post or seen something that I missed - my apologies. @hyperlink["mailto:pmatos@linki.tools"]{Let me know} so I can rectify it in the next issue.
