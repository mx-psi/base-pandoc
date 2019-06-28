## PANDOC VARIABLES
PANDOC:=pandoc # pandoc executable
FILTERS:= filters/env.hs filters/pandoc-crossref pandoc-citeproc # in order
PFLAGS:= $(foreach filter,$(FILTERS),-F $(filter))  # Pandoc flags

## OUTPUT-INDEPENDENT VARIABLES
SRCS:=README.md # Source files in order
DEPS:=src/citations.bib src/style.csl src/header.md src/footer.md

## PDF-SPECIFIC VARIABLES
OUTPDF:=example.pdf
DEPSPDF:=$(DEPS) src/latex.sty
PDFFLAGS:=-H src/latex.sty --template templates/tfg-template.tex

.PHONY: all clean

all: $(OUTPDF)

filters/pandoc-crossref:
	wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.4.0.0-alpha2/linux-ghc84-pandoc22.tar.gz
	tar -xzf linux-ghc84-pandoc22.tar.gz
	cp pandoc-crossref filters/pandoc-crossref
	rm pandoc-crossref linux-ghc84-pandoc22.tar.gz pandoc-crossref.1


$(OUTPDF): filters/pandoc-crossref $(SRCS) $(DEPSPDF)
	$(PANDOC) $(PFLAGS) $(PDFFLAGS) src/header.md $(SRCS) src/footer.md -o $@

clean:
	rm $(OUTPDF)
