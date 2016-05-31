\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custom_cv}[2016/05/30 My custom CV class]

\LoadClass[11pt]{article}

\def\BaseColor{NavyBlue}
\def\RuleSkip{3.5pt}
\def\RuleHeight{1.5pt}

\RequirePackage{lmodern}
\RequirePackage{titlesec}
\RequirePackage[french,english]{babel}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[colorlinks=true, urlcolor=\BaseColor]{hyperref}
\RequirePackage[includeheadfoot]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{marvosym}
\RequirePackage[dvipsnames, table]{xcolor}
\RequirePackage{lastpage}
\RequirePackage{fontawesome}

\newcommand{\TFrom}{De}
\newcommand{\Tto}{à}
\newcommand{\TPage}{Page}
\newcommand{\Tof}{de}
\newcommand{\TFooter}{Références disponibles sur demande}

\geometry{
    a4paper,
    left=20mm,
    right=20mm,
    top=17mm,
    bottom=17mm,
    headsep=3mm,
    headheight=40mm,
}

\newcommand{\MakeHeader}[9]{
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}

    \chead{
        \kern 2pt
        \hbox to \textwidth{\raggedright \LARGE {\bfseries #1} \hfil}% \Large Curriculum Vit\ae}
        \kern \RuleSkip
        \begingroup
        \color{\BaseColor}
        \hrule height \RuleHeight
        \endgroup
        \kern\medskipamount
        \normalsize
        \mbox{}
    }

    \lhead{
        \begin{tabular}[t]{@{}l@{}}
            \normalsize #2 \\
            \normalsize #3 \\
            \normalsize #4
        \end{tabular}\hfill
        \begin{tabular}[t]{@{}r@{}}
            \normalsize #5 \\
            \normalsize \Mobilefone ~ #6 \\
            \normalsize \Letter ~ \href{mailto:#7}{\texttt{#7}} \\
            \normalsize \faGithub ~ \href{https://#8}{\texttt{#8}} \\
            \normalsize \faLinkedin ~ \href{https://#9}{\texttt{#9}}
        \end{tabular}
    }

    \cfoot{
        \emph{\TFooter}
    }

    \rfoot{
        \TPage ~ \textbf{\thepage} \Tof ~ \textbf{\pageref*{LastPage}}
    }
}

\titleformat{\section}
    {\Large\raggedright} % overall format
    {}{0em} % prefix
    {} % prefix code
    [\begingroup \color{\BaseColor} \hrule height \RuleHeight \endgroup]

\newenvironment{Experience}{
    \newcommand{\Item}[6]{
        \begin{minipage}[t]{0.15\columnwidth} \raggedleft \small \TFrom ~ ##1 ~ \Tto ~ ##2 \end{minipage} &
        \begin{minipage}[t]{0.76\columnwidth} \textbf{##3} : ##4. \\ ##5, \emph{##6} \end{minipage}
        \vspace{5mm}
        \tabularnewline
    }

    \noindent
    \setlength{\tabcolsep}{0.02\linewidth}
    \arrayrulecolor{\BaseColor}
    \begin{tabular}{r|l}
}{
    \end{tabular}
    \vspace{-7.5mm}
}

\newenvironment{Skills}{
    \def\headline##1{
        \hbox to \hsize{
            \begingroup
            \color{\BaseColor}
            \hrulefill
            \endgroup
            \quad
            \lower.3em
            \hbox{##1}
            \begingroup
            \color{\BaseColor}
            \quad
            \hrulefill
            \endgroup
        }
    }

    \newlength\cardheight
    \newlength\cardwidth

    \setlength\cardheight{0.25\textheight}
    \setlength\cardwidth{0.5\textwidth}

    \newcommand\Item[2]{%
        \mbox{%
            \begin{minipage}[t]{\dimexpr\cardwidth-2\fboxsep-2\fboxrule\relax}%
            \headline{##1} \vspace{2.5mm} \small ##2%
            \end{minipage}%
            \hspace{4mm}%
        }%
        \vspace{2mm}%
    }

    \noindent
    \centering
}{
    \vspace{-10mm}
}
