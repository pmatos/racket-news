#lang scribble/manual

Title: Racket News - Issue 1
Date: 2019-01-31T08:16:22

In this issue we have the Racket 7.2 release, update on RacketCS, and a few extra goodies that came out recently.

<!-- more -->

Welcome to the first issue of @hyperlink["http://www.racket-lang.org/"]{Racket} News. I am hoping this will be of interest to everyone in the Racket community so if there's something you really dislike, or something you want to see added to the newsletter please @hyperlink["mailto:pmatos@linki.tools"]{send me an email} or @hyperlink["https://github.com/racket-news/racket-news.github.io-src/pulls"]{submit a PR}.

Also, I think at the moment a bi-weekly or monthly newsletter is something reasonable. By this I mean that I should have time to put it together at this regular interval with enough interesting content. If things happen differently when I will change how often it comes out.

@section{What's New?}

@subsection{Racket 7.2 released}

Racket 7.2 has been released! Vincent St-Amour has @hyperlink["https://groups.google.com/d/msg/racket-users/3tL7sFlQ_lo/xPtOEKjPEwAJ"]{announced the release} on January 30, 2019. The listed improvements include collapsible contracts, QuickScript integration, and various improvements to @hyperlink["https://docs.racket-lang.org/racklog/index.html"]{racklog}, among others.

@subsection{RacketCS}

This week we saw an @hyperlink["http://blog.racket-lang.org/2019/01/racket-on-chez-status.html"]{update on Racket-On-Chez} by Matthew Flatt. For those who missed the boat, the whole point of this transition is maintainability. Hopefully with a more maintainable system, things will get easier for those currently contributing to Racket but also newcomers to Racket might more easily contribute PRs to improve the system in general.

The summary on the report is that Racket on Chez is considered mostly done with all functionility in place and most tests passing. There are a few things where RacketCS won't behave the same as current Racket:

@itemlist[
	@item{no single-precision or extended-precision flonums;}
	@item{some differences in the FFI;}
	@item{no support for C API;}
]

There are a few other incompatible points but for more detail please refer to the original post. RacketCS will never be fully compatible with Racket, therefore he whole point is to get people to move their stuff to RacketCS and get rid of the current Racket variant.

However, there are some performance issues that might block a few applications from transitioning right away. Alex Harsanyi, developer of @hyperlink["https://github.com/alex-hhh/ActivityLog2"]{ActivityLog2} @hyperlink["https://groups.google.com/d/msg/racket-users/JryxllMvh94/BjFR01wHFgAJ"]{mentioned in the mailing list} that in his case RacketCS is significantly slower than Racket 7.1. Matthew @italic{promised} in @hyperlink["https://groups.google.com/d/msg/racket-users/JryxllMvh94/AWlIwR3aCwAJ"]{a reply} no switch will happen until performance is good enough.

@subsection{Wiki}

Stephen de Gabrielle has been @hyperlink["https://github.com/racket/racket/wiki/Home/_history"]{seriously active} on the @hyperlink["https://github.com/racket/racket/wiki"]{wiki} side of things. It has some really interesting content and you should check it out.

@subsection{Racket Github Topic}

Stephen de Gabrielle has beautified the @hyperlink["https://github.com/topics/racket"]{GitHub topic for Racket} through a @hyperlink["https://github.com/github/explore/pull/522"]{PR}.

@section{Upcoming Meetups}

@itemlist[
	@item{@hyperlink["https://fosdem.org/2019/"]{FOSDEM2019} - On Feb. 2,3 in Brussels, Belgium FOSDEM will take place. There is a @hyperlink["https://fosdem.org/2019/schedule/track/minimalistic_languages/"]{minimalistic languages interest group} where Racket will be mentioned @hyperlink["https://fosdem.org/2019/schedule/event/guileracket/"]{a} @hyperlink["https://fosdem.org/2019/schedule/event/fractalideandcantor/"]{few} @hyperlink["https://fosdem.org/2019/schedule/event/makeownlangracket/"]{times}}
	@item{@hyperlink["http://bobkonf.de/2019/"]{BOB2019} - Right before Racketfest, also in Berlin, Germany. Directly related to Racket, you a talk by our own @hyperlink["https://bobkonf.de/2019/krishnamurthi.html"]{Shriram Krishnamurthi} and a tutorial by @hyperlink["https://bobkonf.de/2019/alama.html"]{Jesse Alama on WebDev}}
	@item{@hyperlink["https://racketfest.com/"]{RacketFest} - Jesse Alama is organizing the first European Racket Meeting. It will take place in Berlin, Germany on March 23, 2019. Make sure you get your ticket before they sell out... again!}
]

@section{Racket around the web}

Here are a few blog posts about Racket...
@itemlist[
	@item{@hyperlink["http://blog.racket-lang.org/2019/01/racket-on-chez-status.html"]{Racket-on-Chez Status: January 2019}}
	@item{@hyperlink["https://kilotau.com/2019/01/15/can-we-abstract-control-flow.html"]{Can we abstract control flow?}}
]

@section{Project of the Week}

We all know how there are so many hidden gems in the Racket world. I hope, in this section, to make these gems shine, one at a time.

So for this week I chose to mention: @hyperlink["https://github.com/willghatch/racket-rash"]{Rash} by @hyperlink["william@hatch.uno"]{William Hatch}.

From its webpage:
@verbatim|{
Rash is a shell language, library, and REPL for Racket.

Use as a repl that is as convenient for pipelining programs as Bash is, but has all the power of Racket. Use as a scripting language with #lang rash. Embed in normal Racket files with (require rash), and mix freely with any other Racket language or library.

Rash is in active development, but it is largely stable (and the parts that aren't are marked as such). I use it as my default interactive shell on my laptop. It currently lacks the interactive polish of Zsh or Fish, but it is so much better as a language. Every script I've ported from a bourne-related shell to Rash is more robust, simpler, easier to maintain, easier to expand, and much more fun.
}|

I have used it on a regular basis to easily access the shell from Racket and it is brilliant. Check it out!

@section{Stats of mention}

Here is some data from the development of @hyperlink["https://github.com/racket/racket"]{Racket} for the month of January, 2019.

Number of master Commits
Number of Opened PRs
Number of Opened Bugs
Number of Closed Bugs

Bugs open
PRs open

Contributions by:
@itemlist[
@item{@tt{dharmatech}}
@item{Ryan Culpepper}
@item{Robby Findler}
@item{Matthew Flatt}
@item{Spencer Florence}
@item{Ben Greenman}
@item{Greg Hendershott}
@item{Gustavo Massaccesi}
@item{Jay McCarthy}
@item{@tt{rxg}}
@item{Vincent St-Amour}
@item{Sam Tobin-Hochstadt}
@item{@tt{winny-}}
]

@section{Jobs}

If you want to advertise any Racket related jobs, please @hyperlink["mailto:pmatos@linki.tools"]{send me an email} or @hyperlink["https://github.com/racket-news/racket-news.github.io-src/pulls"]{submit a PR}.

@section{Disclaimer}

This issue is brought to you by @hyperlink["mailto:pmatos@linki.tools"]{Paulo Matos}. Any mistakes or inaccuracies are solely mine and
they do not represent the views of the @hyperlink["http://www.racket-lang.org/team.html"]{PLT team}, who develop Racket.

I have also tried to survey the most relevant things that happened in Racket-lan(g|d) recently. If you have done something awesome, wrote a blog post or seen something that I missed - my apologies. @hyperlink["mailto:pmatos@linki.tools"]{Let me know} so I can rectify it in the next issue.

