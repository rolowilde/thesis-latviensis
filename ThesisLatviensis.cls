\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ThesisLatviensis}[University of Latvia thesis]
\LoadClass[a4paper,12pt]{article}

\RequirePackage{etoolbox}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=ULT,
    prefix=ULT@,
    setkeys=\setkeys
}
\DeclareStringOption[english,latvian]{languages}
\ProcessKeyvalOptions*

\PassOptionsToPackage{\ULT@languages}{babel}
\PassOptionsToPackage{
    a4paper,
    left=3cm,
    right=2cm,
    top=2cm,
    bottom=2cm,
}{geometry}

% respect title formatting in table of contents
\PassOptionsToPackage{titles}{tocloft}

% bibliography in order of appearence
\PassOptionsToPackage{sorting=none}{biblatex}

% common caption options
\PassOptionsToPackage{
    font={small},     % ~11 pt
    textfont={bf},    % bold
    labelfont={it},   % italics
    labelsep={space}, % no colon
}{caption}

% caption above table on the right
\AfterEndPreamble{\captionsetup[table]{
    position=top,
    justification=raggedleft,
    slc=off
}}

% metadata
\AfterEndPreamble{\hypersetup{
    pdfsubject={\@title},
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfkeywords={\@keywords}
}}

\RequirePackage{babel}
\RequirePackage{fvextra}
\RequirePackage{csquotes}       %
\RequirePackage{setspace}       % spacing environment
\RequirePackage{enumitem}       %
\RequirePackage{geometry}       % dimensions
\RequirePackage{unicode-math}   % math font support
\RequirePackage{titlesec}       % title spacing & format
\RequirePackage{graphicx}       % figures (includegraphics)
\RequirePackage{caption}        % table & figure caption format
\RequirePackage{biblatex}       % bibliography
\RequirePackage{tocloft}        % table of contents format
\RequirePackage{hyperref}       % links & metadata
\RequirePackage{bookmark}       % bookmarks in pdf
\RequirePackage{ragged2e}       %
\RequirePackage{longtable}      %
\RequirePackage{multirow}       %
\RequirePackage{array}          %
\RequirePackage{minted}         % syntax highlighting in code
\RequirePackage{xstring}        % string manipulation macros

\setmainfont{STIX Two Text}
\setmathfont{STIX Two Math}
\setmonofont[Scale=MatchLowercase]{DejaVu Sans Mono}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
\linespread{1.5}
\setlength{\parindent}{1cm}
\setlist{nosep}

% reset counters at each section
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}

% full baselineskip seemed too large
\titlespacing{\section}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

\titleformat{\section}[block]{\centering\large}{\thesection}{1em}{\MakeUppercase}
\titleformat{\subsection}[block]{\normalsize\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[block]{\normalsize\bfseries}{\thesubsection}{1em}{}

% compact table of contents
\setlength{\cftbeforesecskip}{0.25\baselineskip}
\setlength{\cftbeforesubsecskip}{0.25\baselineskip}
\pretocmd{\tableofcontents}{\begin{spacing}{1}}{}{}
\apptocmd{\tableofcontents}{\end{spacing}}{}{}

\DefineBibliographyStrings{latvian}{references = {Izmantotā literatūra un avoti}}
\addto\captionslatvian{\renewcommand{\figurename}{att.}}

% sections always on new page
% phantomsection to fix unnumbered section links
\newcommand{\sectionbreak}{\clearpage\phantomsection}

% section without counter in ToC
\newcommand{\Section}[1]{%
\section*{#1}\addcontentsline{toc}{section}{#1}}

% section only
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}.}
\renewcommand{\thetable}{\arabic{section}.\arabic{table}.}
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}.}

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}

\newcommand{\institution}[1]{\newcommand{\@institution}{#1}}
\newcommand{\faculty}[1]{\newcommand{\@faculty}{#1}}
\newcommand{\department}[1]{\newcommand{\@department}{#1}}
\newcommand{\subtitle}[1]{\newcommand{\@subtitle}{#1}}
\newcommand{\studentID}[1]{\newcommand{\@studentID}{#1}}
\newcommand{\advisor}[1]{\newcommand{\@advisor}{#1}}
\newcommand{\city}[1]{\newcommand{\@city}{#1}}
\newcommand{\keywords}[1]{\newcommand{\@keywords}{#1}}
\newcommand{\reviewer}[1]{\newcommand{\@reviewer}{#1}}

\renewcommand{\maketitle}{
    \begin{titlepage}
        \begin{spacing}{1}
            \setlength{\parindent}{0pt}
            \begin{center}
                \Large
                \MakeUppercase{\@institution}\par
                \MakeUppercase{\@faculty}\par
                \MakeUppercase{\@department}\par
                \vfill
                {\bfseries \MakeUppercase{\@title}\par}
                \vspace{2\baselineskip}
                \MakeUppercase{\@subtitle}\par
                \vfill
            \end{center}
            \textbf{Darba autors:}~\@author\par
            \vspace{\baselineskip}
            \textbf{Studenta apliecības Nr.:}~\@studentID\par
            \vspace{\baselineskip}
            \textbf{Darba vadītājs:}~\@advisor\par
            \vfill
            \begin{center}
                \Large \MakeUppercase{\@city~\the\year}
            \end{center}
        \end{spacing}
    \end{titlepage}
}

\newcommand{\nocontentsline}[3]{}
\let\origcontentsline\addcontentsline
\newcommand{\stoptoc}{\let\addcontentsline\nocontentsline}
\newcommand{\resumetoc}{\let\addcontentsline\origcontentsline}

% use at the bottom of the document before documentary
\newcommand{\annexes}{
    \Section{Pielikumi}
    \setcounter{section}{0}
    \stoptoc
    \renewcommand{\thesection}{\arabic{section}.~pielikums}
    \titleformat{\section}[display]{\raggedleft}{\thesection}{0pt}{}
}

% use at the bottom of the document after annexes
\newcommand{\documentary}{
    \titleformat{\section}[block]{\centering\large}{\thesection}{1em}{\MakeUppercase}
    \Section{Dokumentārā lapa}
    \RaggedRight
    \@subtitle{} ``\textbf{\@title}'' izstrādāts \@institution s
    \StrGobbleRight{\@faculty}{1} ē,
    \StrGobbleRight{\@department}{1} ā.
    \par\vspace{1cm}
    Ar savu parakstu apliecinu, ka darbs izstrādāts patstāvīgi, izmantoti tikai
    tajā norādītie informācijas avoti un iesniegtā darba elektroniskā kopija
    atbilst izdrukai un/vai recenzentam uzrādītajai darba versijai.
    \par\vspace{1cm}\hspace{1cm}
    Autors: \textbf{\@author}\par\vspace{2cm}
    Darba vadītājs: \textbf{\@advisor}\par\vspace{1cm}
    Recenzents: \textbf{\@reviewer}\par\vspace{2cm}\hspace{1cm}
    Darbs iesniegts \textbf{\today}.
}
