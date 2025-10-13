#jlopes, Thu Nov 30 11:50:38 2023

SRC=report-pup

## typeset using latexmk

latexmk:
	latexmk -pdf -recorder -pvc $(SRC).tex

## clean temporary files

clean: 
	-rm  -f \
	*.aux *.log *.nav *.log *.toc *.snm *.out *.dvi *.ps \
	*latexmk *.bcf *.fls *.bbl *.blg *.lof *.lot *.tdo *.xml \
	*~

.PHONY: clean
