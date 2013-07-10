TARGET = main
EXT = pdf
INDEX_STYLE = index.ist

################################################################################
# do not edit below this line
################################################################################

LATEX = bg5latex
PDFLATEX = pdflatex
BIBTEX = bibtex
MAKEINDEX = makeindex

all: $(TARGET).$(EXT)

$(TARGET).ps: $(TARGET).dvi
	$(DVIPS) $(TARGET).dvi

$(TARGET).dvi: $(TARGET).tex $(TARGET).ind
	$(BIBTEX) $(TARGET)
	$(LATEX) $(TARGET).tex
	$(LATEX) $(TARGET).tex

$(TARGET).pdf: $(TARGET).tex $(TARGET).ind
	$(BIBTEX) $(TARGET)
	$(PDFLATEX) $(TARGET).tex
	$(PDFLATEX) $(TARGET).tex

$(TARGET).ind: $(TARGET).idx
	$(PDFLATEX) $(TARGET).tex
	$(MAKEINDEX) -s $(INDEX_STYLE) $(TARGET).idx

.PHONY: clean
clean:
	-rm -f $(TARGET).aux $(TARGET).ilg $(TARGET).ind \
	$(TARGET).lof $(TARGET).log $(TARGET).lot $(TARGET).toc \
	$(TARGET).blg $(TARGET).bbl *.log *.aux *.out
