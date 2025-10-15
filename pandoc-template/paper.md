---
title: "My Article"
author: "John Doe"
date: \today
documentclass: article
fontsize: 12pt
geometry: margin=1in
colorlinks: true
linkcolor: cyan
citecolor: cyan
urlcolor: cyan
bibliography: bibliography.bib
csl: ieee.csl
header-includes: |
  \usepackage{amsmath,amssymb,amsthm,enumitem,mathtools}
  \usepackage{graphicx}
  \usepackage{pgfplots}
  \usepackage{booktabs}
  \usepackage{csvsimple}
  \usepackage{algorithm}
  \usepackage[noend]{algpseudocode}
  \usepackage{adjustbox}
  \usepackage[xindy, acronyms]{glossaries}
  \makeglossaries
  \renewcommand{\qedsymbol}{$\blacksquare$}
  \renewcommand\arraystretch{1.2}
  \let\oldtabular\tabular
  \let\endoldtabular\endtabular
  \renewenvironment{tabular}{\renewcommand\arraystretch{1.0}\oldtabular}{\endoldtabular}
  \newcommand{\mynote}[1]{\textcolor{blue}{\textbf{[Note: #1]}}}
  \input{definitions.tex}
  \emergencystretch 3em
abstract: |
  We present...
---

# Introduction

Let's try one acronym, LP[^lp]. Let's try one reference [@conforti2014].

[^lp]: Linear Program

**Note:** Here is a todo note.

## Related work

# Our method

Here is an example of optimization problem:

$$
\begin{array}{ll}
  \text{minimize} & f(x)\\
  \text{subject to} & g(x)\le 0,
\end{array}
$$

where $x \in \mathbb{R}^n$ is the optimization variable. See `definitions.tex` to get familiar and possibly add new math definitions.

**Note:** Here is another todo note.

## Theoretical results {#sec:theoretical-results}

**Definition:** This is this.

**Theorem:** This is true.

**Proof:** That's why. $\blacksquare$

# Experimental results

Here is an example table.

| $A$ | $B$ |
|-----|-----|
| 1   | 2   |
| 3   | 4   |

Table: Example table. {#tbl:example}

Figure @fig:tikz shows an example of how to use TikZ.

\begin{figure}
  \centering
  \begin{tikzpicture}
    \begin{axis}[
        samples=100,
        ticks=none,
        xmin = -2.5, xmax = 2.5,
        ymin = -1, ymax = 3,
        axis x line=middle,
        axis y line=middle,
        xlabel={$x$},
        ylabel={$y$},
        x label style={
          at={(axis cs:2,-0.2)},
          anchor=west,
        },
        declare function={f(\x)=abs(\x);},
        ]
      \addplot[thick,color=black, mark=none, domain=-1:1, -,shorten >=1pt] {f(x)};
      \draw[dashed] (axis cs:-1,0) node[below=0.5mm] {$-1$} -- (axis cs:-1,2);
      \draw[thick] (axis cs:-1,1) -- (axis cs:-1,2);
      \draw[dashed] (axis cs:1,0) node[below=0.5mm] {$1$} -- (axis cs:1,2);
      \draw[thick] (axis cs:1,1) -- (axis cs:1,2);
      \addplot[mark=*,fill=black] coordinates {(0,0)};
      \addplot[mark=*,fill=black] coordinates {(1,1)};
      \addplot[mark=*,fill=black] coordinates {(-1,1)};
      \draw[->, thick](axis cs:2,2)--(axis cs:2.3,2.2) node[below=0.5mm](q){$\alpha$};
    \end{axis}
  \end{tikzpicture}
  \caption{Example of TikZ figure.}
  \label{fig:tikz}
\end{figure}

Figure @fig:pgffigure shows an example of how to plot with PGFPlots.

\begin{figure}
  \begin{tikzpicture}
    \begin{axis}
      [
        axis x line=bottom,
        axis y line=left,
        enlarge y limits={0.05, upper},
        enlarge x limits={0.05, upper},
        xtick = {0,...,5},
        xmin = 0,
        ymin = 0,
        width=\textwidth,
        height=0.33\textheight,
        xlabel=$x$,
        ylabel=$f(x)$,
        ]
        \addplot[thick, color=black, mark=none] table [x=a, y=b, col sep=comma] {./data/plot.csv};
        \legend{My Line $f(x)$}
    \end{axis}
  \end{tikzpicture}
  \caption{My caption.}
  \label{fig:pgffigure}
\end{figure}

![Example figure from PDF. This is my caption.](figures/sample.pdf){#fig:examplepdf width=95%}

# References
