

all:  reporte.pdf 

reporte.pdf : reporte.tex
	pdflatex -shell-escape reporte.tex
	bibtex reporte.aux
	pdflatex -shell-escape reporte.tex
	pdflatex -shell-escape reporte.tex

clean:
	rm -f *.log *.aux *.bbl *.lof *.lot *.toc *.blg *.pdf *.gz *~ *.zip *.out

