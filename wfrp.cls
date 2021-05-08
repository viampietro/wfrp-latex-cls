\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfrp}[2021/04/03 Class for Warhammer Fantasy Roleplay 2nd edition ]

\LoadClass{book}

%----------------------------------
% TIKZ
%----------------------------------
\RequirePackage{tikz}
\usetikzlibrary{calc,shapes.geometric}

%----------------------------------
% COLOR DEFINITIONS
%----------------------------------
\RequirePackage{xcolor}
\definecolor{sectioncolor}{RGB}{133, 14, 20}
\definecolor{chaptercolor}{RGB}{100, 62, 44}

% ------------------------------------
% CUSTOM FONTS
% -------------------------------------
\RequirePackage{texnansi}
\pdfmapfile{=CaslonAntique8y.map}
\pdfmapfile{=CaslonAntique-Bold8y.map}

\newcommand{\cafont}%
{\fontfamily{caslonantique}\selectfont}

\newcommand{\cabfont}%
{\fontfamily{caslonantiquebold}\selectfont}

%----------------------------------
% TEXT STYLES & FORMATS
% ----------------------------------

\newcommand{\chapterformat}{\fontsize{30}{35}\selectfont\cabfont}
\newcommand{\sectionformat}[1]{\textcolor{sectioncolor}{\Huge\cabfont\center\MakeUppercase{#1}}}
\newcommand{\ssectionformat}[1]{%
  \tikz{
    \node (orig) at (0,0) {};
    \node[draw,fill=black,diamond, aspect=2] (diam) at (\linewidth-\pgflinewidth-12pt,-3pt) {};
    \draw[line cap=rect] ($(0,-3pt)$) -- (diam);
    \node[rotate=-30] at ($(diam)-(12pt,0)$) {\includegraphics[keepaspectratio,scale=.2]{figures/crescent-moon}};
    \node[fill=black,anchor=west] at ($(orig)-(1pt,0)$) {\cafont\huge\textcolor{white}{#1}};}}

\newcommand{\wbboxed}[1]{\colorbox{black}{\textcolor{white}{\cafont{}#1}}}

%----------------------------------
% TWO COLUMNS MODE
%----------------------------------
\RequirePackage{multicol}
\setlength{\multicolsep}{0pt}

%----------------------------------
% PAGE LAYOUT
%----------------------------------
\RequirePackage[top=2.3cm,
bottom=2.8cm,
left=1.5cm,
right=.5cm,
footskip=40pt]{geometry}

%----------------------------------
% DEFAULT BACKGROUND COLOR
%----------------------------------

\RequirePackage{ifthen}
\RequirePackage{background}

\AddEverypageHook{%
  \ifthenelse{\isodd{\value{page}}}%
  {\backgroundsetup{scale=1,
      color=black,
      opacity=1,
      angle=0,%
      contents={%
        \includegraphics[width=\paperwidth,height=\paperheight]{background-odd}%
      }%
    }%
  }
  {\backgroundsetup{scale=1,
      color=black,
      opacity=1,
      angle=0,%
      contents={%
        \includegraphics[width=\paperwidth,height=\paperheight]{background-even}%
      }%
    }%
  }
  \BgMaterial}%


% ------------------------------------
% DEFAULT CHAPTER STYLE
% -------------------------------------
\RequirePackage[explicit]{titlesec}

\renewcommand{\thechapter}{\Roman{chapter}}

\titleformat{\chapter}[block]{\chapterformat}
{\textcolor{chaptercolor}{\MakeUppercase{\chaptertitlename\ \thechapter: #1}}}{20pt}{}
\titlespacing*{\chapter}{0pt}{0pt}{0pt}

% ------------------------------------
% DEFAULT SECTION STYLE
% -------------------------------------

\titleformat{\section}[block]{\sectionformat{#1\vspace{-1pt}\hrule}}{}{0pt}{}[]
\titlespacing*{\section}{0pt}{0pt}{0pt}

% ------------------------------------
% DEFAULT SUBSECTION STYLE
% -------------------------------------

\titleformat{\subsection}[block]{\ssectionformat{#1}}{}{0pt}{}[]
\titlespacing*{\subsection}{0pt}{10pt}{5pt}

% ------------------------------------
% HEADERS and FOOTERS
% -------------------------------------

\RequirePackage{fancyhdr}
\pagestyle{fancy}

% ------------------------------------
% DEFAULT HEADER
% -------------------------------------
\fancyhead{}
\renewcommand{\chaptermark}[1]{%
  \markboth{\chaptername\ \thechapter:\ #1}{}}
\fancyhead[C]{\fontsize{13}{15}\cabfont\leftmark}
\renewcommand{\headrulewidth}{0pt}

% ------------------------------------
% DEFAULT FOOTER
% -------------------------------------
\fancyfoot[C]{\fontsize{13}{15}\cabfont\thepage}

% --------------------------------------------
% DEFAULT HEADER and FOOTER FOR CHAPTER PAGES
% --------------------------------------------

\fancypagestyle{plain}{

  % ------------------------------------
  % DEFAULT HEADER
  % -------------------------------------
  \fancyhead{}
  \fancyhead[C]{\fontsize{13}{15}\cabfont\leftmark}
  \renewcommand{\headrulewidth}{0pt}

  % ------------------------------------
  % DEFAULT FOOTER
  % -------------------------------------
  \fancyfoot[C]{\fontsize{13}{15}\cabfont\thepage}

}





