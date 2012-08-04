TEXS=$(wildcard *.tex)

.PHONY: all clean latexclean images

all: $(TEXS:tex=pdf)

clean: latexclean
	rm $(TEXS:tex=pdf) 2>/dev/null; true

%.pdf: %.tex images
	pdflatex $<
	pdflatex $<
	$(MAKE) latexclean

images:
	$(MAKE) -C images

latexclean:
	rm $(TEXS:tex=log) $(TEXS:tex=aux) $(TEXS:tex=out) $(TEXS:tex=toc) 2>/dev/null; true
	$(MAKE) -C contents latexclean