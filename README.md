# `base-pandoc`

A basic `pandoc` setup for creating PDF documents.

## What is this?

It is a ready-to-clone repository to start your `pandoc` [Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown)[^what-markdown] to PDF project.
Install the dependencies, clone this repository and you are ready to go!

The idea is to provide a minimal setup for creating documents that use several pandoc filters.

[^what-markdown]: Don't know Markdown? You can use [this tutorial](https://commonmark.org/help/tutorial). Pandoc's allows you to use your favorite Markdown standard and even some extra features that you can check at [the manual](http://pandoc.org/MANUAL.html#extensions)

## How do I install it?

First, install the dependencies:

- GNU Make
- [`pandoc` and `pandoc-citeproc`](http://pandoc.org/installing.html) with the recommended PDF output package
- [`pandoc-crossref`](https://github.com/lierdakil/pandoc-crossref/releases/latest)
- [Haskell](https://www.haskell.org/downloads) and pandoc-types if you want to use the [`env`](https://github.com/mx-psi/tidbits/tree/master/pandoc-environments) filter

If everything goes well you can type `make` and you will get a pdf version of this `README` file.

## How do I use it?

Edit the `SRCS` variable to change the list of source files. Apart from pandoc's basic Markdown you can use:

- [citations](https://github.com/jgm/pandoc-citeproc/blob/master/man/pandoc-citeproc.1.md); an empty BibTeX file is provided at `citations.bib` and a simple CSL style is provided at `style.csl`, 
- [cross-references](https://lierdakil.github.io/pandoc-crossref/) and 
- [divs as LaTeX environments](https://github.com/mx-psi/tidbits/tree/master/pandoc-environments)

# Alternatives

If you are not going to use the filters there is no real reason to use this.
You might want to use bare pandoc or, if you don't like the default look use a template such as [this](https://github.com/Wandmalfarbe/pandoc-latex-template).
