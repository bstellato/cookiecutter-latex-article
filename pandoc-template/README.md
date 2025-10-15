# Pandoc Markdown Paper Template

A ready-to-use pandoc template for writing academic papers in markdown, based on the cookiecutter-latex-article template.

## Quick Start

1. Edit `paper.md` to write your paper
2. Add references to `bibliography.bib`
3. Add custom LaTeX math commands to `definitions.tex`
4. Compile to PDF:

```bash
make
```

## Requirements

- pandoc (with pandoc-crossref and pandoc-citeproc)
- LaTeX distribution (TeX Live, MiKTeX, etc.)
- Make (optional, for using Makefile)

### Install pandoc

```bash
# macOS
brew install pandoc pandoc-crossref

# Linux (Ubuntu/Debian)
sudo apt-get install pandoc pandoc-crossref

# Or download from: https://pandoc.org/installing.html
```

## Usage

### Compile to PDF

```bash
make
```

Or manually:

```bash
pandoc paper.md --pdf-engine=pdflatex --number-sections --filter pandoc-crossref --citeproc -o paper.pdf
```

### Compile to LaTeX

To generate intermediate LaTeX file for inspection:

```bash
make tex
```

### Clean build files

```bash
make clean
```

## Features

- YAML metadata header for title, author, date
- Full LaTeX math support with custom definitions
- Bibliography management with BibTeX
- Cross-references for figures, tables, equations
- TikZ and PGFPlots support for inline graphics
- CSV table support
- Customizable styling via LaTeX packages

## File Structure

```
pandoc-template/
├── paper.md           # Main markdown file (edit this!)
├── bibliography.bib   # BibTeX references
├── definitions.tex    # LaTeX math definitions and macros
├── Makefile          # Build automation
├── README.md         # This file
├── data/             # Data files (CSV for tables/plots)
│   ├── plot.csv
│   └── table.csv
└── figures/          # Image files
    └── sample.pdf
```

## Markdown Tips

### Citations

Use `[@key]` for citations, e.g., `[@conforti2014]`

### Math

Inline math: `$x \in \mathbb{R}^n$`

Display math:
```
$$
\begin{array}{ll}
  \text{minimize} & f(x)
\end{array}
$$
```

### Cross-references

Figures: `![Caption](path){#fig:label}` then reference with `@fig:label`

Tables: Add `{#tbl:label}` after table, reference with `@tbl:label`

Sections: Add `{#sec:label}` after header, reference with `@sec:label`

### Notes

Use `**Note:**` to create inline notes (styled as blue TODO notes in output)

## Customization

- Edit YAML frontmatter in `paper.md` for document metadata
- Modify `definitions.tex` for custom LaTeX commands
- Add LaTeX packages in the `header-includes` section of YAML frontmatter
- Change citation style by replacing `ieee.csl` with another CSL file

## Converting from LaTeX

If you have an existing LaTeX paper:

```bash
pandoc paper.tex -o paper.md
```

Then manually adjust formatting as needed.
