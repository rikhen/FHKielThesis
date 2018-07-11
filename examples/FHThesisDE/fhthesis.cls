%% fhthesis.cls
%% LaTeX template for creating diploma theses, masters's theses, bachelor's theses and other term papers.
%% This file is part of the Hagenberg Thesis package for creating bachelors's and masters's theses
%% Author: Henrik Liebel (henrik.liebel@student.fh-kiel.de)
%% GitHub: 
%% File encoding: ASCII

%% Package Information --------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hgbthesis}
\ProvidesClass{fhthesis}[2018/07/11]

\RequirePackage{ifpdf}	% for checking PDF mode 
\ifpdf{}% \typeout{hgbthesis: *** LaTeX in PDF mode ***}
\else{\errmessage{liethesis: *** LaTeX NOT running in PDF mode ***}}
\fi


%% Commands for Title Pages (used in class options) ---------------------------

\newcommand{\fh@MainLanguage}{german}	% also referenced in hgb.sty
\renewcommand{\@mastertitlepages}{}
%\renewcommand{\@diplomatitlepages}{}
\renewcommand{\@bachelortitlepages}{}
\newcommand{\@researchtitlepages}{}
\newcommand{\@projecttitlepages}{}
%\renewcommand{\@internshiptitlepages}{}
\newcommand{\@maketitlepages}{\@mastertitlepages}  %Default: Master's thesis


%% Class options --------------------------------------------------------------

\DeclareOption{research}{%
	\renewcommand{\@maketitlepages}{\@researchtitlepages}
}

\DeclareOption{project}{%
	\renewcommand{\@maketitlepages}{\@projecttitlepages}
}

\DeclareOption*{%
	\ClassWarning{fhthesis}{Unknown document option '\CurrentOption'.}
}

\ProcessOptions


%% Paper Options and Style File -----------------------------------------------

\LoadClass[a4paper,11pt,oneside,listof=totoc]{scrreprt}
\RequirePackage[includeheadfoot,top=30mm,bottom=15mm,left=20mm,right=20mm,headsep=\baselineskip,footskip=\dimexpr2\baselineskip+3mm\relax]{geometry} %showframe
\RequirePackage{scrhack} % KOMA-Packet um float Warnungen zu unterdrücken
\RequirePackage{hgb}	% load associated style file hgb.sty
\RequirePackage{fh}	% load associated style file fh.sty

\setlength{\parindent}{0em}% Verhindert Einrücken zu Absatzbeginn
% Schriftgrößen der Überschriften anpassen
\setkomafont{sectioning}{\normalfont\normalcolor\bfseries}% Titel Serifen
\setkomafont{chapter}{\Large}
\setkomafont{section}{\large}
\setkomafont{subsection}{\large}


%% Setup for Pages in the Front Matter ----------------------------------------

% General Commands

\newcommand{\@university}{\@MissingArg{University not specified!}}
\newcommand{\hochschule}[1]{%
	\renewcommand{\@university}{#1}
	\ClassWarning{liethesis}{Deprecated: '\string\hochschule' is deprecated, use '\string\university' instead.}
}
\newcommand{\university}[1]{%
	\ifthenelse{\isempty{#1}}{}{\renewcommand{\@university}{#1}}
}

\newcommand{\@department}{\@MissingArg{Department not specified!}}
\newcommand{\fachbereich}[1]{%
	\renewcommand{\@department}{#1}
	\ClassWarning{liethesis}{Deprecated: '\string\fachbereich' is deprecated, use '\string\department' instead.}
}
\newcommand{\department}[1]{%
	\ifthenelse{\isempty{#1}}{}{\renewcommand{\@department}{#1}}
}

\newcommand{\@studentnumber}{\@MissingArg{Student number not specified!}}
\newcommand{\matrikelnummer}[1]{%
	\renewcommand{\@studentnumber}{#1}
	\ClassWarning{liethesis}{Deprecated: '\string\matrikelnummer' is deprecated, use '\string\studentnumber' instead.}
}
\newcommand{\studentnumber}[1]{%
	\ifthenelse{\isempty{#1}}{}{\renewcommand{\@studentnumber}{#1}}
}

\newcommand{\@secondexaminer}{\@MissingArg{Second advisor not specified!}}
\newcommand{\zweitpruefer}[1]{%
	\renewcommand{\@secondexaminer}{#1}
	\ClassWarning{liethesis}{Deprecated: '\string\zweitpruefer' is deprecated, use '\string\secondexaminer' instead.}
}
\newcommand{\zweitprueferin}[1]{%
	\renewcommand{\@secondexaminer}{#1}
	\ClassWarning{liethesis}{Deprecated: '\string\zweitprueferin' is deprecated, use '\string\secondexaminer' instead.}
}
\newcommand{\secondexaminer}[1]{%
	\ifthenelse{\isempty{#1}}{}{\renewcommand{\@secondexaminer}{#1}}
}

\newcommand{\makelogo}[0]{%
	\ifthenelse{\equal{\@logofile}{}}%
	{\vspace*{30mm}}%
	{\centering\scalebox{0.7}{\includegraphics[height=30mm]{\@logofile}}}%
}

% Submission Commands


\newcommand{\abgabetag}[1]{%
	\ClassWarning{liethesis}{Deprecated: '\string\abgabetag' is deprecated, use '\string\dateofsubmission{yyyy}{mm}{dd}' instead.}
}

% Internship Report Commands


%% Commands for Creating the Title Pages --------------------------------------

\renewcommand{\@bachelortitle}{%
\begin{titlepage}%
	\begin{german}
		\rule{0mm}{1mm}
		\vspace*{0mm}
		\begin{center}%
			\makelogo%
			\vskip 10mm%			
%			\@titlepagefont %\normalfont
			\setlength{\unitlength}{1cm}
			\parbox[c][5cm][c]{12cm}{%
				\centering\huge\bfseries%
				\setlength{\baselineskip}{25pt}%
				\@title%
			}
			\vskip 10mm%
			%{\LARGE{\@addspaces{Bachelor-Arbeit}}}%
			{\Huge\bfseries{{Bachelor-Arbeit}}}%
			\vskip 0mm%
			\parbox[c][5cm][c]{12cm}{%
			\centering\LARGE%
			\setlength{\baselineskip}{25pt}%
			im Fachbereich \@department\\
			Studiengang \@programname\\
			\@university %
			}		
			\vskip 0mm%
			{\large{vorgelegt von\\}}
			{\LARGE{\@author\\}}%{\large\scshape\@author}%
			{\large{Matrikelnummer: \@studentnumber}}
			\vskip 10mm%
			{\LARGE{\@semester}}
			\vskip 10mm%
			{\large{Betreuer: \@advisor}}
			\vskip 5mm%
			{\large \@placeofstudy, \arabic{@dayofsubmission}. \monthname[\value{@monthofsubmission}] \arabic{@yearofsubmission}}%
		\end{center}%
		\vfil%
	\end{german}
\end{titlepage}%
}

\renewcommand{\@mastertitle}{%
\begin{titlepage}%
	\begin{german}
		\rule{0mm}{1mm}
		\vspace*{0mm}
		\begin{center}%
			\makelogo%
			\vskip 10mm%			
%			\@titlepagefont %\normalfont
			\setlength{\unitlength}{1cm}
			\parbox[c][5cm][c]{12cm}{%
				\centering\huge\bfseries%
				\setlength{\baselineskip}{25pt}%
				\@title%
			}
			\vskip 10mm%
			%{\LARGE{\@addspaces{Bachelor-Arbeit}}}%
			{\Huge\bfseries{{Master-Arbeit}}}%
			\vskip 0mm%
			\parbox[c][5cm][c]{12cm}{%
			\centering\LARGE%
			\setlength{\baselineskip}{25pt}%
			im Fachbereich \@department\\
			Studiengang \@programname\\
			\@university %
			}		
			\vskip 0mm%
			{\large{vorgelegt von\\}}
			{\LARGE{\@author\\}}%{\large\scshape\@author}%
			{\large{Matrikelnummer: \@studentnumber}}
			\vskip 10mm%
			{\LARGE{\@semester}}
			\vskip 10mm%
			{\large{Betreuer: \@advisor}}
			\vskip 5mm%
			{\large \@placeofstudy, \arabic{@dayofsubmission}. \monthname[\value{@monthofsubmission}] \arabic{@yearofsubmission}}%
		\end{center}%
		\vfil%
	\end{german}
\end{titlepage}%
}

\newcommand{\@projecttitle}{%
\begin{titlepage}%
	\begin{german}
		\rule{0mm}{1mm}
		\vspace*{0mm}
		\begin{center}%
			\makelogo%
			\vskip 10mm%			
%			\@titlepagefont %\normalfont
			\setlength{\unitlength}{1cm}
			\parbox[c][5cm][c]{12cm}{%
				\centering\huge\bfseries%
				\setlength{\baselineskip}{25pt}%
				\@title%
			}
			\vskip 10mm%
			%{\LARGE{\@addspaces{Bachelor-Arbeit}}}%
			{\Huge\bfseries{{Industrieprojekt}}}%
			\vskip 0mm%
			\parbox[c][5cm][c]{12cm}{%
			\centering\LARGE%
			\setlength{\baselineskip}{25pt}%
			im Fachbereich \@department\\
			Studiengang \@programname\\
			\@university %
			}		
			\vskip 0mm%
			{\large{vorgelegt von\\}}
			{\LARGE{\@author\\}}%{\large\scshape\@author}%
			{\large{Matrikelnummer: \@studentnumber}}
			\vskip 10mm%
			{\LARGE{\@semester}}
			\vskip 10mm%
			{\large{Betreuer: \@advisor}}
			\vskip 5mm%
			{\large \@placeofstudy, \arabic{@dayofsubmission}. \monthname[\value{@monthofsubmission}] \arabic{@yearofsubmission}}%
		\end{center}%
		\vfil%
	\end{german}
\end{titlepage}%
}

\newcommand{\@researchtitle}{%
\begin{titlepage}%
	\begin{german}
		\rule{0mm}{1mm}
		\vspace*{0mm}
		\begin{center}%
			\makelogo%
			\vskip 10mm%			
%			\@titlepagefont %\normalfont
			\setlength{\unitlength}{1cm}
			\parbox[c][5cm][c]{12cm}{%
				\centering\huge\bfseries%
				\setlength{\baselineskip}{25pt}%
				\@title%
			}
			\vskip 10mm%
			%{\LARGE{\@addspaces{Bachelor-Arbeit}}}%
			{\Huge\bfseries{{Studienarbeit}}}%
			\vskip 0mm%
			\parbox[c][5cm][c]{12cm}{%
			\centering\LARGE%
			\setlength{\baselineskip}{25pt}%
			im Fachbereich \@department\\
			Studiengang \@programname\\
			\@university %
			}		
			\vskip 0mm%
			{\large{vorgelegt von\\}}
			{\LARGE{\@author\\}}%{\large\scshape\@author}%
			{\large{Matrikelnummer: \@studentnumber}}
			\vskip 10mm%
			{\LARGE{\@semester}}
			\vskip 10mm%
			{\large{Betreuer: \@advisor}}
			\vskip 5mm%
			{\large \@placeofstudy, \arabic{@dayofsubmission}. \monthname[\value{@monthofsubmission}] \arabic{@yearofsubmission}}%
		\end{center}%
		\vfil%
	\end{german}
\end{titlepage}%
}

% Copyright and License Page --------------------------------------------------

%% Company Page for Internship Report -----------------------------------------

%% Advisor Pages in German and English ----------------------------------------

% German


% English


%% Declaration Pages in German and English ------------------------------------

% German

\renewcommand{\@declarationpageDe}{%
	\begin{german}
		\chapter*{Eidesstattliche Erkl\"arung} %
		\Large{% 
		\noindent
		Ich erkl\"are hiermit an Eides Statt, dass ich die vorliegende Arbeit selbstst\"andig
		verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
		Die aus fremden Quellen direkt oder indirekt \"ubernommenen Gedanken sind als
		solche gekennzeichnet. Die Arbeit wurde bisher in gleicher oder \"ahnlicher Form keiner anderen Pr\"ufungsbeh\"orde vorgelegt und auch nicht ver\"offentlicht.
		\par
		\vspace{10mm}
		\noindent
		\@placeofstudy, den \formatdate{\value{@dayofsubmission}}{\value{@monthofsubmission}}{\value{@yearofsubmission}}
		\par
		\vspace{12mm}
		\noindent
		\@author
	}
	\end{german}
}

% English

%% Assembly of title pages ----------------------------------------------------

\renewcommand{\@bachelortitlepages}{
	\@bachelortitle
	\@declarationpage
}

\renewcommand{\@researchtitlepages}{
	\@researchtitle
	\@declarationpage
}

\renewcommand{\@projecttitlepages}{
	\@projecttitle
	\@declarationpage
}

\renewcommand{\@internshiptitlepages}{
	\@internshiptitle
	\@companypage
	\@declarationpage
}

% Add PDF meta data and create title pages

\renewcommand{\maketitle}{	%replace standard LaTeX-command
	\hypersetup{
			pdftitle={\@title},
			pdfauthor={\@author},
			pdfsubject={\@programname, \@placeofstudy},
			pdfcreator={LaTeX using class hgbthesis [\hgbDate]},
			pdfproducer={pdflatex},
			pdfkeywords={},
			pageanchor=false	% disable hyperref page anchors in frontmatter pages
	}%
	\@maketitlepages
	\hypersetup{pageanchor=true}	% enable hyperref page anchors in the main document
}

%% Additional FH-Kiel packages ----------------------------------------------

\RequirePackage{hgbmath}
\RequirePackage{fhheadings}
\RequirePackage{hgbabbrev}
\RequirePackage{hgblistings}
\RequirePackage{hgbbib}
\RequirePackage{fhbib}

\endinput
