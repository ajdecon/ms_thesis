# .tex files
DOCNAME = thesis

# Set to "yes" if you have a bibliography.
HASHBIB = yes

TEX = pdflatex
BIB = bibtex
SPELL = aspell
RM = rm -f
WC = wc -w

ASPELL_FLAGS = -t check

TEXFILES = \
	thesis.tex \
	acknowledgements.tex \
	complex-shapes.tex \
	computerized-tracking.tex \
	conclusions.tex \
	grayscale.tex \
	introduction.tex \
	literature-review.tex \
	microfluidic-chambers.tex \
	rods.tex \

ifeq ($(HASHBIB), yes)
all: spellcheck makebib makepdf wc
else
all: spellcheck makepdf wc
endif

spellcheck:
	$(foreach var,$(TEXFILES), $(SPELL) $(ASPELL_FLAGS) $(var);)

wc:
	$(foreach var,$(TEXFILES), $(WC) $(var);)

makebib:
	$(TEX) $(DOCNAME)
	$(BIB) $(DOCNAME)

makepdf:
	$(TEX) $(DOCNAME)
	$(TEX) $(DOCNAME)

clean:
	$(RM) $(TEXFILES:.tex=.aux)
	$(RM) $(TEXFILES:.tex=.log)
	$(RM) $(TEXFILES:.tex=.lof)
	$(RM) $(TEXFILES:.tex=.pdf)
	$(RM) $(TEXFILES:.tex=.dvi)
	$(RM) $(TEXFILES:.tex=.idx)
	$(RM) $(TEXFILES:.tex=.toc)
ifeq ($(HASHBIB), yes)
	$(RM) *.bbl
	$(RM) *.blg
endif
