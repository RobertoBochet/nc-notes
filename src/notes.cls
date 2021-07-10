%! Class = notes
%! Author = Roberto Bochet

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[A class for engineering notes]

\LoadClass[12pt]{report}

% codec
\RequirePackage[utf8]{inputenc}

% geometry
\RequirePackage{geometry}
\geometry{
	a4paper,
	left=30mm,
	right=30mm,
	top=40mm,
	bottom=30mm
}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}

% sections counters
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}


%% math
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage[makeroom]{cancel} % to put a obliquos line on a math symbol to delete it
\RequirePackage{nicefrac} % to create fractions like a/b

% math operators
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}

\newcommand{\Lie}[1]{\mathcal{L}_{#1}}
\newcommand{\Lieb}[2]{\left[ #1, #2 \right]}
\newcommand{\ad}[1]{\operatorname{ad}_{#1}}
\newcommand{\Lebesgue}{\mathcal{L}}
\newcommand{\Lebesgueext}{\Lebesgue_e}

\DeclareMathOperator{\rad}{rad}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\rank}{rank}

\newcommand{\pdiff}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\diff}[2]{\frac{d #1}{d #2}}

\newcommand{\trans}{\mathsf{T}}
\newcommand{\inv}{{-1}}
\newcommand{\psinv}{\dag}

% math domains
\newcommand{\Real}{\mathbb{R}}
\newcommand{\RealP}{\Real^+}
\newcommand{\RealN}{\Real^-}
\newcommand{\Complex}{\mathbb{C}}

% math mod
\newcommand{\matr}[1]{\boldsymbol{#1}}
\newcommand{\vect}[1]{\boldsymbol{#1}}
\newcommand{\estimate}[1]{\hat{#1}}
\newcommand{\error}[1]{\tilde{#1}}
\newcommand{\reference}[1]{\bar{#1}}

%math snippets
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{conjecture}{Conjecture}[chapter]
\newtheorem{example}{Example}[chapter]
\newtheorem{definition}{Definition}[chapter]

%% block diagram
\usepackage{tikz}
\usetikzlibrary{circuits}
\usetikzlibrary{shapes}
\usetikzlibrary{arrows}
\usetikzlibrary{positioning}

\tikzset{auto,>=latex', minimum size=0pt, node distance=1, font=\fontsize{11}{11}\selectfont}

\tikzstyle{pinstyle} = [pin edge={to-,thin,black}]
\tikzstyle{block} = [draw, fill=white, rectangle, minimum height=3em, minimum width=4em, text centered, align=center]
\tikzstyle{integrator} = [draw, fill=white, rectangle, minimum height=3em, minimum width=2em, font={$\frac{1}{s}$}]
\tikzstyle{sum} = [draw, fill=white, circle, node distance=1cm]
\tikzstyle{input} = [coordinate]
\tikzstyle{output} = [coordinate]
\tikzstyle{gain} = [draw, isosceles triangle, minimum height = 3em, isosceles triangle apex angle=60]
\tikzstyle{spy} = [coordinate, inner sep=0, outer sep=0, minimum size=0]
\tikzstyle{node} = [draw, circle, fill, minimum size=2pt, inner sep=0pt, outer sep=0pt, anchor=center]

%% other packages
\RequirePackage[pdfusetitle]{hyperref}
\RequirePackage[capitalize,nameinlink,noabbrev]{cleveref}
\RequirePackage{svg}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{tabularx}
\RequirePackage{soul} % to highlight text
\RequirePackage{enumitem} % to create lists
\RequirePackage{csquotes}

%% layout
\RequirePackage[stable]{footmisc}
\RequirePackage{imakeidx}
\RequirePackage[backend=biber]{biblatex}

% title
\RequirePackage{ltxcmds}
\newcommand{\IfPackageLoaded}[2]{\ltx@ifpackageloaded{#1}{#2}{}}

\renewcommand\maketitle{
	\pagenumbering{Alph}
	\begin{titlepage}
		\centering
		\vspace*{\stretch{2}}

		\Huge\textbf{\@title}

		\vspace*{\stretch{0.6}}

		\Large\emph{\@author}

		\bigskip

		\large \@date

		\vspace*{\stretch{5.0}}
		\IfPackageLoaded{doclicense}{
			\doclicenseImage[imagewidth=3cm]

			\doclicenseLongText
			\vspace*{\stretch{0.3}}
		}
	\end{titlepage}
	\thispagestyle{empty}
	\pagenumbering{arabic}
}

\AtBeginDocument{
	\makeindex[intoc]
}

%% usefull enviroments
\newenvironment{nb}
{
	\par\vspace{\abovedisplayskip}\noindent\begin{em}n.b.\ \ignorespaces
}{
	\end{em}
}

\newenvironment{conditions}
{
	\par\vspace{\abovedisplayskip}\noindent\centering\begin{tabular}{>{$}r<{$} @{${}:{}$} l}
}{
	\end{tabular}\par\vspace{\belowdisplayskip}
}
