% ----------------------------------
% IDENTIFICATION
% ----------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfrp}[2021/04/03 Class for
Warhammer Fantasy Roleplay 2nd edition. ]

% ----------------------------------
% INITIAL CODE
% ----------------------------------

\RequirePackage{ifthen}
\newboolean{frenchon}

% ----------------------------------
% DECLARATION OF OPTIONS
% ----------------------------------

\DeclareOption{french}{
  \PassOptionsToPackage{french}{babel}
  \setboolean{frenchon}{true}
}

% Passes all options that are not explicitly declared above to the
% report class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% ----------------------------------
% EXECUTION OF OPTIONS
% ----------------------------------

\ProcessOptions\relax

% -------------------------------------------------------
% PACKAGE LOADING
% -------------------------------------------------------

% wfrp class extends book class.
\LoadClass{book}

\RequirePackage{babel}

\ifthenelse{\boolean{frenchon}}{
  \PackageInfo{babel}{Loading with french option on}
  \frenchbsetup{StandardLists=true}
}{
  \PackageInfo{babel}{Loading without french option on}
}

\RequirePackage{tikz}
\usetikzlibrary{calc,shapes.geometric}

\RequirePackage{xcolor}
\RequirePackage{multicol}
\RequirePackage{background}
\RequirePackage[explicit]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[skins]{tcolorbox}

%=======================================
%---------------------------------------
% MAIN CODE
%---------------------------------------
%=======================================


%----------------------------------
% COLOR DEFINITIONS
%----------------------------------

\definecolor{sectioncolor}{RGB}{133, 14, 20}
\definecolor{chaptercolor}{RGB}{100, 62, 44}
\definecolor{leftrulemjboxcolor}{RGB}{147, 47, 45}

%----------------------------------
% TEXT STYLES & FORMATS
% ----------------------------------

\newcommand{\chapterformat}{\fontsize{30}{35}\bfseries\selectfont}
\newcommand{\sectionformat}[1]{\textcolor{sectioncolor}{\Huge\bfseries\selectfont\center\MakeUppercase{#1}}}
\newcommand{\ssectionformat}[1]{%
  \tikz{
    \node (orig) at (0,0) {};
    \node[draw,fill=black,diamond, aspect=2] (diam) at (\linewidth-\pgflinewidth-12pt,-3pt) {};
    \draw[line cap=rect] ($(0,-3pt)$) -- (diam);
    \node[rotate=-30] at ($(diam)-(12pt,0)$) {\includegraphics[keepaspectratio,scale=.2]{figures/crescent-moon}};
    \node[fill=black,anchor=west] at ($(orig)-(1pt,0)$) {\bfseries\huge\textcolor{white}{#1}};}}

\newcommand{\wbboxed}[1]{\colorbox{black}{\textcolor{white}{#1}}}

%----------------------------------
% TWO COLUMNS MODE
% ----------------------------------

\setlength{\multicolsep}{0pt}

%----------------------------------
% PAGE LAYOUT
%----------------------------------
\RequirePackage[top=2.3cm,
bottom=2.8cm,
left=1.5cm,
right=1.5cm,
footskip=40pt]{geometry}

%----------------------------------
% DEFAULT BACKGROUND COLOR
%----------------------------------

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

\renewcommand{\thechapter}{\Roman{chapter}}

\titleformat{\chapter}[block]{\chapterformat}
{\textcolor{chaptercolor}{\MakeUppercase{#1}}}{20pt}{}

% Star version to kill the indentation of the paragraph coming after
% the chapter
\titlespacing*{\chapter}{0pt}{0pt}{0pt}

% ------------------------------------
% DEFAULT SECTION STYLE
% -------------------------------------

\titleformat{\section}[block]{\sectionformat{#1\hrule}}{}{0pt}{}[]
\titlespacing*{\section}{0pt}{0pt}{0pt}

% ------------------------------------
% DEFAULT SUBSECTION STYLE
% -------------------------------------

\titleformat{\subsection}[block]{\ssectionformat{#1}}{}{0pt}{}[]
\titlespacing*{\subsection}{0pt}{10pt}{5pt}

% ------------------------------------
% HEADERS and FOOTERS
% -------------------------------------

\pagestyle{fancy}

% ------------------------------------
% DEFAULT HEADER
% -------------------------------------
\fancyhead{}
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}}
\fancyhead[C]{\fontsize{13}{15}\bfseries\leftmark}
\renewcommand{\headrulewidth}{0pt}

% ------------------------------------
% DEFAULT FOOTER
% -------------------------------------
\fancyfoot[C]{\fontsize{13}{15}\bfseries\thepage}

% --------------------------------------------
% DEFAULT HEADER and FOOTER FOR CHAPTER PAGES
% --------------------------------------------

\fancypagestyle{plain}{

  % ------------------------------------
  % DEFAULT HEADER
  % -------------------------------------
  \fancyhead{}
  \fancyhead[C]{\fontsize{13}{15}\bfseries\leftmark}
  \renewcommand{\headrulewidth}{0pt}

  % ------------------------------------
  % DEFAULT FOOTER
  % -------------------------------------
  \fancyfoot[C]{\fontsize{13}{15}\bfseries\thepage}

}

% --------------------------------------------
% ENVIRONMENT MJBOX
% --------------------------------------------

\newtcolorbox{mjbox}{standard jigsaw, fontupper=\itshape\bfseries,%
  boxrule=0mm, leftrule=1pt,%
  sharp corners, enlarge left by=2mm, width=\textwidth-2mm,%
  colframe=leftrulemjboxcolor, opacityback=0, left=2pt}



