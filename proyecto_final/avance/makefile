

all:  avance.pdf 

avance.pdf : avance.tex
	pdflatex avance.tex
	bibtex avance.aux
	pdflatex avance.tex
	pdflatex avance.tex

clean:
	rm -f *.log *.aux *.bbl *.lof *.lot *.toc *.blg *.pdf *.gz *~ *.zip *.out

