PDFLATEX = pdflatex -interaction=batchmode -synctex=1
SH 		 = /bin/bash
ASCRIPT  = /usr/bin/osascript

SOURCE   = reviewer1.tex
BASE     = "$(basename $(SOURCE))"

default : pdf view 

.PHONY: pdf graphics
pdf: $(SOURCE)
	# run pdflatex and bibtex multiple times to get references right
	$(PDFLATEX) $(BASE) && bibtex $(BASE) && $(PDFLATEX) $(BASE) && $(PDFLATEX) $(BASE)

.PHONY: view
view: 
	# reload the document in Skim
	$(SH) skim-view.sh $(BASE)

.PHONY: clean
clean :
	# remove all TeX-generated files in your local directory
	$(RM) -f -- *.aux *.bak *.bbl *.blg *.log *.out *.toc *.tdo _region.*