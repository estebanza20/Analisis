

all:  reporte.pdf trabajo.zip


reporte.pdf :
	pdflatex Reporte/PracMatlab01_Grupo3_B42781_B47769_B42481.tex

trabajo.zip:
	zip -r PracMatlab01_Grupo3_B42781_B47769_B42481.zip /Reporte/*.pdf *.m
clean:
	rm -f *.log *.aux *.pdf *.gz *~ *.zip
