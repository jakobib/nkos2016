# requires pandoc, biber, biblatex, xelatex

PAPER_OPTIONS = -N -s -S --template=llncs.latex -H header.tex
SLIDES_OPTS = --slide-level 2 -t beamer --template vzg-slides.tex

slides.pdf: slides.md
	pandoc -s -S $(SLIDES_OPTS) $(FILTER) --biblio=bibliography.bib -o $@ $<

paper.pdf: paper.tex
	latexmk -xelatex -pdf $<
	latexmk -c

paper.tex: paper.md
	pandoc $(PAPER_OPTIONS) --biblio=bibliography.bib --biblatex -o $@ $<

clean:
	latexmk -c
