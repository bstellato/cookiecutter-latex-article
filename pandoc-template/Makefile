# Makefile for compiling markdown to PDF using pandoc

# Variables
PAPER = paper
MD_FILE = $(PAPER).md
PDF_FILE = $(PAPER).pdf
TEX_FILE = $(PAPER).tex
BIB_FILE = bibliography.bib

# Pandoc options
PANDOC_FLAGS = --pdf-engine=pdflatex \
               --number-sections \
               --filter pandoc-crossref \
               --citeproc

# Default target
all: $(PDF_FILE)

# Compile markdown to PDF
$(PDF_FILE): $(MD_FILE) $(BIB_FILE) definitions.tex
	pandoc $(MD_FILE) $(PANDOC_FLAGS) -o $(PDF_FILE)

# Compile markdown to LaTeX (for inspection)
tex: $(MD_FILE) $(BIB_FILE) definitions.tex
	pandoc $(MD_FILE) $(PANDOC_FLAGS) -o $(TEX_FILE)

# Clean auxiliary files
clean:
	rm -f $(PDF_FILE) $(TEX_FILE) *.aux *.log *.out *.toc *.bbl *.blg

# Watch for changes and recompile
watch:
	@echo "Watching for changes..."
	@while true; do \
		inotifywait -e modify $(MD_FILE) $(BIB_FILE) 2>/dev/null || \
		(sleep 2); \
		make all; \
	done

.PHONY: all tex clean watch
