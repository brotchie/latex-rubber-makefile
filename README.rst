Makefile for compiling LaTeX into PDF using Rubber
==================================================

LatexCommon.mk provides a set of common LaTeX compilation targets which make
building PDFs from LaTeX document a breeze.

Simple create a Makefile in your document directory and include LatexCommon.mk::

    include path/to/LatexCommon.mk

The primary .tex for your document should be specified before including
LatexCommon.mk::

    TARGET=example

Example use of LatexCommon.mk is provided in the example directory. Simply
navigate to the example directory and run make.

Real-world Example
==================

I have a paper I'm working on that I'm building using LatexCommon.mk. My paper's directory comprises::

    # Symbolic link to a bibtex input file exported automatically from Mendeley Desktop.
    authors.bib
    # The LaTeX source for my paper.
    dynamic.tex
    # The makefile including LatexCommon.mk.
    makefile

where makefile contains::

    TARGET=dynamic
    MATLAB_FIGURE_DIRECTORY=$(HOME)/phd/src/dynamic/paperfigures/figures/
    LATEX_INCLUDE_PATHS+=$(MATLAB_FIGURE_DIRECTORY)
    ADDITIONAL_DEPS+=$(wildcard $(MATLAB_FIGURE_DIRECTORY)/*.pdf)
    
    include ../../../latex/LatexCommon.mk

``authors.bib`` will be automatically included as a dependency of ``dynamic.pdf``. My paper includes a number of figures
that are generated by Matlab then saved as .pdfs in ``$(HOME)/phd/src/dynamic/paperfigures/figures/``; thus I've included
them as additional dependencies by appending to the ``ADDITIONAL_DEPS`` variable. This means that if I regenerate the figures
from Matlab without otherwise changing ``dynamic.tex`` a new ``dynamic.pdf`` will be built with the new figures.
