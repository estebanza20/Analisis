

all:  reporte.pdf trabajo.zip


reporte.pdf :
	pdflatex Reporte/PracMatlab02_Grupo3_B42781_B47769_B42481.tex
	pdflatex Reporte/PracMatlab02_Grupo3_B42781_B47769_B42481.tex
	pdflatex Reporte/PracMatlab02_Grupo3_B42781_B47769_B42481.tex

trabajo.zip:
	zip -r Grupo_3.zip *.pdf *.m *.slx
clean:
	rm -f *.log *.aux *.pdf *.gz *~ *.zip *.out

