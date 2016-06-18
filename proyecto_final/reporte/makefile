

all:  reporte.pdf 

reporte.pdf : reporte.tex
	pdflatex reporte.tex
	bibtex reporte.aux
	pdflatex reporte.tex
	pdflatex reporte.tex

clean:
	rm -f *.log *.aux *.bbl *.lof *.lot *.toc *.blg *.pdf *.gz *~ *.zip *.out

