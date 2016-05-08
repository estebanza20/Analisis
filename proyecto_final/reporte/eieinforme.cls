%archivo de estilo de la clase ``eieinforme'' (V.M. Alfaro)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eieinforme}[2012/02/01 Informe de prácticas y laboratorios EIE-UCR]

\DeclareOption*{\PassOptionsToclass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[12pt,oneside]{article}

\RequirePackage[english,spanish]{babel}
\RequirePackage{babelbib}
\RequirePackage[ansinew]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ae,aecompl}
\RequirePackage[parfill]{parskip}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\RequirePackage{graphicx}%[dvips]
\RequirePackage{float}
\RequirePackage{natbib}
\RequirePackage{url}
\RequirePackage[letterpaper,textwidth=15.5cm,textheight=21.5cm,left=3.5cm,top=3cm]{geometry}
\RequirePackage{setspace}
\RequirePackage{booktabs}
\RequirePackage[colorlinks=true,linkcolor=black,urlcolor=black, citecolor=black, pdfstartview={FitH}]{hyperref}


%definición símbolos matemáticos
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\md}{\mathrm{d}}

\newcommand{\ucreie}{Universidad de Costa Rica \\ Facultad de Ingeniería \\ Escuela de Ingeniería Eléctrica}
\newcommand{\info}{INFORME}
\newcommand{\por}{Por:}
\newcommand{\pie}{Ciudad Universitaria ``Rodrigo Facio'', Costa Rica}

\def\curso#1{\gdef\@curso{#1}}

\def\autorA#1{\gdef\@autorA{#1}}
\def\autorB#1{\gdef\@autorB{#1}}
\def\autorC#1{\gdef\@autorC{#1}}

%portada
\newcommand{\eietitlepage}{
\thispagestyle{empty}
\begin{center}
	\Large\bfseries\ucreie\\
	\vskip 3em
	%\info \\
	\vskip 1em
	\@curso
	\vskip 1em
	\LARGE\bfseries\@title\\
	\vskip 3em
	\large\bfseries\por
	\vskip 1em
	\large\bfseries\@autorA \\
	\large\bfseries\@autorB \\
	\large\bfseries\@autorC \\
	\vfill
	\large\bfseries\pie
	\vskip 1em
	\large\bfseries\@date
\end{center}}

\endinput
