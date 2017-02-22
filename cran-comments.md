# idendr0 1.5.3
-----------------------------------------------------------------------
## Test environments
* linux Fedora 24, R 3.3.1 using platform x86_64, linux-gnu
* win-builder (release), R version 3.3.2 (2016-10-31) using platform x86_64-w64-mingw32 (64-bit)
* win-builder (devel), R development (unstable) (2017-02-22 r72243) using platform: x86_64-w64-mingw32 (64-bit)

## R CMD check results
There were no ERRORs or WARNINGs.

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Tomas Sieger <tomas.sieger@seznam.cz>'

Possibly mis-spelled words in DESCRIPTION:
  Dendrograms (3:20)
  Tcl (18:65)
  Tk (18:69)
  backport (17:15)
  dendrogram (13:26, 14:41)

Found the following (possibly) invalid DOIs:
  DOI: 10.18637/jss.v076.i10
    From: inst/CITATION
    Status: Not Found
    Message: 404
    
The possibly mis-spelled words are OK.

The DOI in the CITATION is for a new JSS publication that will be registered after publication on CRAN.


# idendr0 1.5.2
-----------------------------------------------------------------------
## Test environments
* linux Fedora 17, R 3.2.2
* linux Fedora 17, R 3.1.3
* linux ubuntu 14.04.3, R 3.2.1
* linux ubuntu 14.04.3, R development (unstable) (2015-10-15 r69519)
* win-builder (release), R version 3.2.2 (2015-08-14)
* win-builder (devel), R development (unstable) (2015-10-13 r69519)

## R CMD check results
There were no ERRORs, or WARNINGs. 

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Tomas Sieger <tomas.sieger@seznam.cz>'
  Days since last update: 2

The reason for submitting that soon is that I've fixed a bug (I
accidentally omitted conditioning on 'interactive()' in interactive
examples, I'm sorry for that) and I've been asked by Prof. Brian Ripley
to provide a fix ASAP. 


# idendr0 1.5.1
-----------------------------------------------------------------------
## Test environments
* linux Fedora 17, R 3.2.2
* linux Fedora 17, R 3.1.3
* linux ubuntu 14.04.3, R 3.2.1
* linux ubuntu 14.04.3, R development (unstable) (2015-10-05 r69468)
* win-builder (release), R version 3.2.2 (2015-08-14)
* win-builder (devel), R development (unstable) (2015-10-13 r69511)

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs. 


# idendr0 1.5.0
-----------------------------------------------------------------------
## Test environments
* local linux Fedora 17, R 3.1.3
* linux ubuntu 14.04.3, R development (unstable) (2015-10-05 r69468)
* win-builder (release), R version 3.2.2 (2015-08-14)
* win-builder (devel), R development (unstable) (2015-10-05 r69468)

## R CMD check results
There were no ERRORs or WARNINGs. 

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Tomas Sieger <tomas.sieger@seznam.cz>'
New submission
