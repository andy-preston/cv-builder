\usepackage{hyperref}

\LoadClass[11pt,a4paper]{letter}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mycv}[2020-09-23 My custom class for CVs]

\lefthyphenmin=50
\righthyphenmin=50
\raggedright

\usepackage[margin=1.5cm,a4paper]{geometry}
\pagestyle{empty}
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\setlength{\parindent}{0pt}
\setlength{\parskip}{4pt}

\usepackage{datetime}
\ddmmyyyydate
\newtimeformat{mytime}{\twodigit{\THEHOUR}:\twodigit{\THEMINUTE}}
\settimeformat{mytime}

\usepackage{xcolor}
\definecolor{headingBlue}{RGB}{0, 0, 80}

\newcommand\matches[2]{\pdfmatch{.*#1.*}{#2}=1}

\newcommand\boldIf[3]{\ifnum\matches{#1}{#2}\textbf{#3}\else#3\fi}

\newcommand{\firstLine}[2]{#1\hfill Ref: \today{} \currenttime{} #2}

\newcommand{\sectionHeading}[1]{
    \noindent\colorbox{headingBlue}{
        \strut\makebox[\dimexpr \linewidth-4\fboxsep][l]{
            \color{white}
            \textbf{#1}
        }
    }
}

\newcommand{\topHeading}[1]{\begin{center}\textbf{#1}\end{center}}

\newcommand{\subHeading}[1]{\color{headingBlue}\textbf{#1}\color{black}}

\newcommand{\jobHeading}[2]{\subHeading{#1}\\\subHeading{#2}}
