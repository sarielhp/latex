% ======================================================================
%  uiucletter.cls
%  letterhead for UIUC Computer Science
%
%  Hacked from Darrell Anderson's ``dletter.cls''
%  by Jeff Erickson <jeffe@uiuc.edu>
%  Last modified: 3/29/01
% ----------------------------------------------------------------------
%  Prior to \begin {document}, use the following to customize the
%  letterhead.  Setting an entry to nothing, e.g. ``\phone{}'', causes
%  it to be omitted.  Not specifying anything causes the default to be
%  used.
%
%       \office{...}    default: 2113~ [Just the DCL office number!]
%                                follow by tie(~) to get spacing right
%       \phone{...}     default: (217) 333-6769
%       \fax{...}       default: (217) 244-6500 [currently ignored]
%       \email{...}     default: jeffe@cs.uiuc.edu
%       \www{...}       default: http://www.uiuc.edu/~jeffe
%
% ----------------------------------------------------------------------
%  \documentclass{uiucletter}
%
%  \office{2113~}
%  \phone{(217) 333-6769}
%  \email{jeffe@cs.uiuc.edu}
%  \www{http://www.cs.uiuc.edu/~jeffe}
%  \signature{Jeff Erickson}
%  
%  \begin{document}
%  \begin{letter}{Widgits, Inc\\123 Some Street\\Nowhere, FL 12345-6789}
%  \opening{To whom it may concern,}
%  
%  Please send me some widgits.
%  
%  \closing{Sincerely,}
%  \end{letter}
%  \end{document}
% ----------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uiucletter}

%\RequirePackage{url}
%\RequirePackage{epsfig}
\usepackage[ocgcolorlinks]{hyperref}
\hypersetup{%
   breaklinks,%
   ocgcolorlinks, %
   colorlinks=true,%
   urlcolor=[rgb]{0.45,0.0,0.0},%
   linkcolor=[rgb]{0.0,0.45,0.0},%
   citecolor=[rgb]{0,0,0.45}%
}%


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[]{letter}

\newcommand{\@phone}{}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\@fax}{} 
\newcommand{\fax}[1]{\renewcommand{\@fax}{#1}}
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{\url{#1}}}
\newcommand{\@www}{}
\newcommand{\www}[1]{\renewcommand{\@www}{\url{#1}}}
\newcommand{\@office}{}
\newcommand{\office}[1]{\renewcommand{\@office}{#1}}
\name{}
\signature{}
\address{~}


% \setlength{\textwidth}{6.5in}
% \setlength{\textheight}{9in}
% \setlength{\topmargin}{0in}
% \setlength{\oddsidemargin}{0in}
% \setlength{\evensidemargin}{0in}
% \setlength{\headsep}{0in}
% \setlength{\headheight}{0in}

\longindentation=.4\textwidth
\indentedwidth=\textwidth
\advance\indentedwidth -\longindentation

\let\@texttop\relax
\stopbreaks

\AtBeginDocument{ % defer processing so \email{} etc can be defined

\def\opening#1{
\noindent
\parbox[t]{\textwidth}{
%\vspace{2cm}
\small\sf
\hrulefill
   \begin{center}
%        \epsfig{file=$HOME/papers/styles/figs/UIlogo.eps,width=3in} \\
        \includegraphics[width=3in]{\HOME/papers/styles/figs/UIlogo} \\
%       \textsc{\Large University of Illinois at Urbana-Champaign} \\[1ex]
        \textsf{\large~~DEPARTMENT OF COMPUTER SCIENCE}% \\[1ex]
 %       \begin{tabular}{l}
%            \@office Siebel Center \\
%            201 N. Goodwin Avenue \\
%            Urbana, IL 61801-2302\\
%           USA
%        \end{tabular}
 %       \hspace{1in}
%        \urlstyle{same}
%        \begin{tabular}{r}
%            \@phone \\
%           Fax: \@fax \\
%            \@email \\
%            \@www
%        \end{tabular}
   \end{center}
\hrulefill}
\par
\thispagestyle{empty}
\enlargethispage{0.5in} % (rasm frasm flism flop!)
\vskip \z@ plus.00006fil
{\raggedleft\@date\par}
{\raggedright\toname\\\toaddress\par}\vspace{2\parskip}
#1\par\nobreak}

\renewcommand{\ps@empty} {
        \setlength{\topmargin}{-0.5in}
        \setlength{\headheight}{0in}
        \setlength{\headsep}{0in}
        \renewcommand{\@oddhead}{}
        \renewcommand{\@oddfoot}{}
}

} % end of \AtBeginDocument

\providecommand{\@evenhead}{}
\providecommand{\@evenfoot}{}
\providecommand{\@oddhead}{}
\providecommand{\@oddfoot}{}

\renewcommand*{\startlabels}{\labelcount\z@
  \pagestyle{empty}%
  \ifcase \@ptsize\relax
    \LARGE
  \or
    \Large
  \or
    \large
  \fi
  \baselineskip \z@
  \lineskip \z@
  \boxmaxdepth \z@
  \parindent \z@
  \onecolumn\relax}

\renewcommand*{\mlabel}[2]{\begin{tabular}{l}#2\end{tabular}\par\bigskip}
