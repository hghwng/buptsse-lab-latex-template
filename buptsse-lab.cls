\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{buptsse-lab}[2014/08/16 LaTeX class for labs of BUPT SSE]
\LoadClass[12pt]{article}

\RequirePackage[margin=30mm]{geometry}
\RequirePackage{indentfirst, xeCJK, CJKnumb}
\RequirePackage{ulem, etoolbox, xstring}
\RequirePackage{minted}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fontspec}
\setCJKmainfont[BoldFont={方正准雅宋_GBK}]{方正兰亭刊宋_GBK}
\setCJKfamilyfont{Caption}{方正粗雅宋_GBK}
\setCJKfamilyfont{SubCaption}{方正准雅宋_GBK}
\setCJKfamilyfont{Item}{方正标雅宋_GBK}
\setmonofont{Source Code Pro}

\newcommand{\SetLabCol}[1]{\def\@LabCol{#1}}
\newcommand{\@AddLabCol}[1]{\uline{\makebox[12em][l]{#1}}}

\newcommand{\SetLabMeta}[2]{
  \def\@LabCourseName{#1}
  \def\@LabTeacherName{#2}
}

\def\@LabAuthorName{\StrBefore{\@author}{,}}
\def\@LabAuthorId{\StrBehind{\@author}{,}}

\newcommand{\@AddLabItem}[2]{
  \makebox[5em][r]{#1：} &
  \parbox[t]{12em}{#2}
  \vspace{1.5em}
  \\
}

\newcounter{@LabYear}      \setcounter{@LabYear}{\the\year}
\newcounter{@LabYearStart} \setcounter{@LabYearStart}{\the\year}
\newcounter{@LabYearEnd}   \setcounter{@LabYearEnd}{\the\year}
\newcounter{@LabMonth}     \setcounter{@LabMonth}{\the\month}
\newcounter{@LabDay}       \setcounter{@LabDay}{\the\day}

\newcommand{\SetLabDate}[1]{\@SetLabDate#1\relax}
\def\@SetLabDate#1-#2-#3\relax{
  \setcounter{@LabYear}{#1}
  \setcounter{@LabYearStart}{#1}
  \setcounter{@LabYearEnd}{#1}
  \setcounter{@LabMonth}{#2}
  \setcounter{@LabDay}{#3}
}

\renewcommand{\maketitle}{\begin{titlepage}
  \begin{center}
    \CJKfamily{Caption}     \Huge\textbf{北京邮电大学软件学院}  \\
    \CJKfamily{SubCaption}  \huge\textbf{
      \ifnum\value{@LabMonth} < 9
        \def\@LabSemester{二}
        \addtocounter{@LabYearStart}{-1}
      \else
        \def\@LabSemester{一}
        \addtocounter{@LabYearEnd}{1}
      \fi
      \arabic{@LabYearStart}--\arabic{@LabYearEnd}学年第{\@LabSemester}学期实验报告
    }

    \vspace{4em}

    \CJKfamily{Item}\large
    \begin{tabular}{ll}
      \@AddLabItem{课程名称}{\uline{\@LabCourseName\hfill}}
      \@AddLabItem{实验名称}{\uline{\@title\hfill}}
      \@AddLabItem{指导教师}{\uline{\@LabTeacherName\hfill}}
      \@AddLabItem{实验完成人}{
        \ifundef{\@LabCol}{%
          \@AddLabCol{\@LabAuthorName}
        }{%
          \@for\@tmp:=\@LabCol\do{%
            \@AddLabCol{\@tmp}
          }
        }
      }
      \vspace{1.5em}
    \end{tabular}

    \vspace{\fill}

    姓名：\underline{\,\@LabAuthorName\,}\,
    学号：\underline{\,\@LabAuthorId\,}\,
    成绩：\underline{\hspace{3em}}

    \vspace{2em}

    \begin{flushright}
      日期：\arabic{@LabYear}年\arabic{@LabMonth}月\arabic{@LabDay}日
    \end{flushright}

    \vspace{2em}
  \end{center}

\end{titlepage}}
