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
PDFFLAGS:=-H src/latex.sty

.PHONY: all clean

all: $(OUTPDF)

$(OUTPDF): $(SRCS) $(DEPSPDF)
	$(PANDOC) $(PFLAGS) $(PDFFLAGS) src/header.md $(SRCS) src/footer.md -o $@

clean:
	rm $(OUT)
