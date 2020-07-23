\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{S4F-FFM}[Latex Klasse für interne Kommunikation, Konzepte, etc.]

\LoadClass[a4paper]{scrartcl}
\RequirePackage{sectsty}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage[german]{babel}
\RequirePackage[colorlinks=true, urlcolor=S4FLightBlue]{hyperref}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{graphicx}
\RequirePackage{fontspec}
\RequirePackage[includeheadfoot,left=1.5cm,right=1.5cm,top=1.5cm,bottom=1.7cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

% change all @ commands into regular commands
% I am abusing the author command for the place
\newcommand{\thetitle}{\@title}
\newcommand{\thesubtitle}{\@subtitle}
\newcommand{\thedate}{\@date}
\newcommand{\theplace}{\@author}
\newcommand{\place}[1]{\author{#1}}

% define a commonly used separation length
\newlength{\sep}
\setlength{\sep}{.7cm}

% define new column types for tables with given width
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

% set the font with fontspec -> cannot be compiled with pdftex
\setsansfont[Kerning=Uppercase]{Montserrat}
\renewcommand*\familydefault{\sfdefault}

% define the S4F colors
\definecolor{S4FDarkBlue}{RGB}{33, 55, 98}
\definecolor{S4FLightBlue}{RGB}{76, 152, 199}

% set default document color
\color{S4FDarkBlue}

% add a convenient command to highlight things
\newcommand{\alert}[1]{\textbf{\color{S4FLightBlue}#1}}

% set the color of the headline
\newcommand{\headlinecolor}{\color{S4FDarkBlue}}

% set colors of sections
\sectionfont{\color{S4FDarkBlue}}

% renew the maketitle command for the nice header
\renewcommand{\maketitle}{%
    \headlinecolor
    \thispagestyle{first}
    ~\\[-2cm]
    \begin{tabular}{@{}L{0.7\textwidth}@{}R{0.3\textwidth}@{}}
        \Large{\textbf{\thetitle}} & \multirow{4}{*}{\includegraphics[width=.17\textwidth]{s4f_logo_frankfurtammain.pdf}} \\[.3cm]
        \thesubtitle & \\[.6cm]
        Datum: \hfill \thedate& \\
        Ort: \hfill \theplace & \\
    \end{tabular}

    \vspace{\sep}\noindent\rule{\textwidth}{1pt}\\[.3cm]
}

% set the header and footer for all pages
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{
    \centering
    \color{S4FDarkBlue}\rule{\textwidth}{1pt}\\[.4cm]
    \thepage \hspace{3pt}/ \pageref*{LastPage}
}
\fancyhead{}
\fancyhead[L]{\color{S4FDarkBlue}\thetitle \hfill \thedate\\\rule{\textwidth}{1pt}}

% set header and footer for first page -> no heading, is repllaced with title
\fancypagestyle{first}
{
   \fancyfoot[CE,CO]{
        \centering
        \color{S4FDarkBlue}\rule{\textwidth}{1pt}\\[.4cm]
        \thepage \hspace{3pt}/ \pageref*{LastPage}
    }
    \fancyhead{}

}
