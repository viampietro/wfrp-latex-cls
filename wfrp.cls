\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfrp}[2021/04/03 Class for Warhammer Fantasy Roleplay 2nd edition ]

\LoadClass[twocolumn]{book}

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
% CUSTOM FONTS
% -------------------------------------

\RequirePackage{texnansi}
\pdfmapfile{=CaslonAntique8y.map}
\pdfmapfile{=CaslonAntique-Bold8y.map}

\newcommand{\cafont}%
{\fontfamily{caslonantique}\selectfont}

\newcommand{\cabfont}%
{\fontfamily{caslonantiquebold}\selectfont}

% ------------------------------------
% CHAPTER STYLE
% -------------------------------------
\RequirePackage{titlesec}
\renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}[block]
  {\Huge\cabfont}
  {\chaptertitlename\ \thechapter:}{20pt}{\Huge}

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





