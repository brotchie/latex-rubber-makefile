Makefile for compiling LaTeX into PDF using Rubber
==================================================

LatexCommon.mk provides a set of common LaTeX compilation targets which make
building PDFs from LaTeX document a breeze.

Simple create a Makefile in your document directory and include LatexCommon.mk::

    include path/to/LatexCommon.mk

The primary .tex for your document should be specified before including
LatexCommon.mk::

    TARGET=example

Example use of LatexCommon.mk is provided in the example directory. Simple
navigate to the example directory and run make.
