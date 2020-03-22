%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportClass}%no need for a date[2014/08/16 Example LaTeX class]
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX Example: Project Report
%
% Source: http://www.howtotex.com
%
% Feel free to distribute this example, but please keep the referral
% to howtotex.com
% Date: March 2011 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Edit the title below to update the display in My Documents
%\title{Project Report}
%
 
\LoadClass[paper=a4, fontsize=11pt]{scrartcl}
\RequirePackage[T1]{fontenc}
\RequirePackage{fourier}
\RequirePackage{tocloft}
\RequirePackage[english]{babel}		% English language/hyphenation
\RequirePackage[utf8]{inputenc}     % for non-ascii character support
%\RequirePackage[protrusion=true,expansion=true]{microtype}	
\RequirePackage{amsmath,amsfonts,amsthm} % Math packages
\RequirePackage{dsfont} %for fancy expectation, real symbols etc.
\RequirePackage{fixmath} %for bold greek symbols
\RequirePackage[cal=cm]{mathalfa} %for identity matrix
\RequirePackage{cancel} %cancel to function
\RequirePackage{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{svg}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{amsmath,amssymb}
\RequirePackage{calrsfs}
\graphicspath{Figures}
\RequirePackage{url}
\RequirePackage{hyperref}
\RequirePackage{xcolor,colortbl}
%%% Custom sectioning
\RequirePackage{sectsty}
\allsectionsfont{\normalfont\scshape}


\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancyplain}
\fancyhead[R]{\@author}	
\fancyhead[L]{\@className}
\fancyfoot[L]{}											% Empty 
\fancyfoot[C]{}											% Empty
\fancyfoot[R]{\thepage/\pageref{LastPage}}									% Pagenumbering
\renewcommand{\headrulewidth}{1pt}		    % Do not remove header underlines
\renewcommand{\footrulewidth}{0pt}				% Remove footer underlines
\setlength{\headheight}{13.6pt}

\RequirePackage{biblatex}
\RequirePackage{csquotes}

\RequirePackage{geometry}
\geometry{bmargin=1.25in}

\RequirePackage{enumitem}

\RequirePackage{chngcntr}
\counterwithout{figure}{section}
\renewcommand{\thefigure}{\c@figure}
%%% Equation and float numbering
\numberwithin{equation}{section}		% Equationnumbering: section.eq#
\numberwithin{figure}{section}			% Figurenumbering: section.fig#
\numberwithin{table}{section}			% Tablenumbering: section.tab#


%%% Maketitle metadata
\newcommand{\horrule}[1]{\rule{\linewidth}{#1}} 	% Horizontal rule

\def\universityName#1{\def\@universityName{#1}}
\def\departmentName#1{\def\@departmentName{#1}}
\def\className#1{\def\@className{#1}}
\def\reportName#1{\def\@reportName{#1}}

\newcommand{\printtitle}{
\begin{centering}
    \normalfont \normalsize \textsc{\@universityName\\
        \@departmentName\\
        \@className \\ \@reportName}\\
        \today \\
    \horrule{1pt} \\[0.4cm]
    
    \Large \@title\\
	\horrule{1pt} \\[0.4cm]
\end{centering}
}


\newcommand*\prefixClosure[1]{\overline{#1}}
\newcommand*\st[0]{\textnormal{ s.t. }}

\hfuzz=5.002pt 

\DeclareSymbolFont{letters}{OML}{cmr}{m}{it}