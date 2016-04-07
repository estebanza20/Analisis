

all:  reporte.pdf


reporte.pdf : 
	pdflatex *.tex
clean:
	rm -f *.log *.aux *.pdf *.gz *~ *.zip
