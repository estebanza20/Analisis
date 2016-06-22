TEX = pdflatex
TARGET = presentation


$(TARGET).pdf : $(TARGET).tex
	$(TEX) $(TARGET).tex
	$(TEX) $(TARGET).tex

$(TARGET).aux: $(TARGET).tex
	$(TEX) $(TARGET).tex

clean:
	rm -f -r *.log *.snm *.nav *.aux  *.gz prv_* *.prv _region* *.lof *.lot *.toc *.out *.bbl *.dvi *.blg $(TARGET).pdf $(TARGET).pdf *~
