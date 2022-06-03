%%%
%%% @(#) tuc-thesis.cls -- pseudo class for thesis at Clausthal University
%%%
%%%<<<<<<< HEAD
%%% Time-stamp:  <2018-11-27 09:40:17 tmjb>
%%%=======
%%% Time-stamp:  <2018-03-13 20:11:26 tmjb>
%%%>>>>>>> c0e325c5671e959bdd184b9353c9f6a5ffb5a761
%%%
%%%
%%% @(#) $Id: $
%%% @(#) $Keywords: TU Clausthal, TUC, LaTeX, Bachelor thesis, Master thesis $
%%%
%%%
%%%          File: /usr/local/texmf/tex/latex/TUC/tuc-thesis.cls
%%%       Project: TUC-THESIS
%%%       Version: $Revision: $
%%%   Description: Klasse zum Schreiben von Bachelor- und Masterarbeiten.
%%%        Author: tmjb -- Jan Braun <Jan.Braun@tu-clausthal.de>
%%%    Maintainer: tmjb -- Jan Braun <Jan.Braun@tu-clausthal.de>
%%% Creation-Date: Wed 11  May 2016 -- Jan Braun <Jan.Braun@tu-clausthal.de>
%%%     Copyright: (c) 2016 Jan Braun
%%%

%%% ------------------------------------------------------ &Change Log ---
%%%
%%% $Log:  $


%%% ============================================================ &Code ===

%%% ---------------------------------------------------- &Package Name ---
% \NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tuc-thesis}[2016/06/02 v0.05  TU Clausthal]


%%% ------------------------------------------------------- &Variables ---
%% We need some variables, to store and indicate which options (see
%% later) are choosen ...
\newif\if@draft                 % for Option draft
\newif\if@final                 % Oposite of draft
\newif\if@tucfont               % use the corporate design font
\newif\if@afourpaper            % papersize DIN A4
\newif\if@afivepaper            % papersize DIN A5
\newif\if@letter                % american letter papersize
\newif\if@english\@englishfalse % use english language and logos
\newif\if@tuctitle              % Use the TUC titlepage.
\newif\if@preprint              % Use preprinted paper for titlepage
\newif\if@noindent              % Use Indentation or not



%%% --------------------------------------------------------- &Options ---
%% Options are definid by the main package or for this special style
%% file.  Just add them in square brackets like this:
%% \usepackage[final,foo,bar]{tuc-thesis}
%% I advise, to avoid using final and draft in package related
%% options, as the are normally handed over from the main class
%% package options.
%%
%% ............................................................ &draft ...
%% Option draft is per default defined by the main class package,
%% unless you specify final.  This style defines it for continuity
%% reasons.  Draft and final are mutualy exclusive
\DeclareOption{draft}{%
  \@drafttrue
  \@finalfalse
  \PassOptionsToClass{draft}{scrbook}
  \PassOptionsToPackage{draft}{graphicx}
  \PassOptionsToPackage{draft}{tuc-thesis}
  \PassOptionsToPackage{draft}{tuc-cd}
}

%% ............................................................ &Final ...
%% Option final is set, when you intend to print the final copy of
%% your work.
\DeclareOption{final}{%
  \@draftfalse
  \@finaltrue
  \PassOptionsToClass{final}{scrbook}
  \PassOptionsToPackage{final}{graphicx}
  \PassOptionsToPackage{final}{tuc-thesis}
  \PassOptionsToPackage{final}{tuc-cd}
}

%% .......................................................... &TUCFont ...
%% Option final is set, when you intend to print the final copy of
%% your work.
\DeclareOption{tucfont}{%
  \@tucfonttrue%
  \PassOptionsToPackage{tucfont}{tuc-cd}%
}%

%% .......................................................... &A4paper ...
%% Option a4paper is set, to typeset on DIN A4 papersize.  It should
%% be the Default size.
\DeclareOption{a4paper}{%
  \@afourpapertrue
  \@afivepaperfalse
  \@letterfalse
  \PassOptionsToClass{a4paper}{scrbook}
  \PassOptionsToPackage{a4paper}{tuc-thesis}
  \PassOptionsToPackage{a4paper}{tuc-cd}
}%

%% .......................................................... &A5paper ...
%% Option a5paper is set, to typeset on DIN A4 papersize.
\DeclareOption{a5paper}{%
  \@afourpaperfalse
  \@afivepapertrue
  \@letterfalse
  \PassOptionsToClass{a5paper}{scrbook}
  \PassOptionsToPackage{a5paper}{tuc-thesis}
  \PassOptionsToPackage{a5paper}{tuc-cd}
}%


%% ...................................................... &letterpaper ...
%% Option letterpaper is set, to typeset on american letter papersize.
\DeclareOption{letterpaper}{%
  \@afourpaperfalse
  \@afivepaperfalse
  \@lettertrue
  \PassOptionsToClass{letter}{scrbook}
  \PassOptionsToPackage{letter}{tuc-thesis}
  \PassOptionsToPackage{letter}{tuc-cd}
}%

%% .......................................................... &ngerman ...
%% Option german is set, when your work is primarily in german language.
\DeclareOption{ngerman}{%
  \@englishfalse
  \PassOptionsToPackage{german}{tuc-thesis}
  \PassOptionsToPackage{german}{tuc-cd}
  \PassOptionsToPackage{ngerman}{babel}
}%

%% ........................................................... &german ...
%% Option german is set, when your work is primarily in german language.
\DeclareOption{german}{%
  \@englishfalse
  \PassOptionsToPackage{german}{tuc-thesis}
  \PassOptionsToPackage{german}{tuc-cd}
  \PassOptionsToPackage{german}{babel}
}%

%% .......................................................... &english ...
%% Option english is set, when your work is primarily in english language.
\DeclareOption{english}{%
  \@englishtrue
  \PassOptionsToPackage{english}{tuc-thesis}
  \PassOptionsToPackage{english}{tuc-cd}
  \PassOptionsToPackage{english}{babel}
}%

%% ........................................................ &tuc-title ...
%% Option tuctitle should be used, when you want to have a different
%% style for the title page.
\DeclareOption{tuctitle}{%
  \@tuctitletrue
  \PassOptionsToPackage{tuctitle}{tuc-thesis}
}%

%% ......................................................... &preprint ...
%% Option preprint does not print the Logo and grey box.
\DeclareOption{preprint}{%
  \@preprinttrue%
  \PassOptionsToPackage{preprint}{tuc-thesis}%
}%

%% ......................................................... &Noindent ...
%% Option noindent shall be used, when paragraphs shall be separated
%% by gaps instead of indenting them.
\DeclareOption{noindent}{%
  \@noindenttrue%
  \PassOptionsToPackage{noindent}{tuc-cd}%
}%

%% ....................................................... &Undeclared ...
%% This one is for any option, which was not declared before.
\DeclareOption*{%
  \typeout{^^J tuc-thesis.cls: Handing unknown option {\CurrentOption} to class scrbook ^^J}
  \PassOptionsToClass{\CurrentOption}{scrbook}%
}%
%% Set the options.
\ExecuteOptions{final,ngerman,a4paper}%
\ProcessOptions\relax


%% ........................................................... &Checks ...
\if@draft{%
  \typeout{^^J tuc-thesis.cls: Option 1) draft selected ^^J }%
\fi%
\if@final{%
  \typeout{^^J tuc-thesis.cls: Option 2) final selected ^^J }%
\fi%
\if@tucfont{%
  \typeout{^^J tuc-thesis.cls: Option 3) tucfont selected ^^J }%
\fi%
\if@afourpaper{%
  \typeout{^^J tuc-thesis.cls: Option 4) afourpaper selected ^^J }%
\fi%
\if@afivepaper{%
  \typeout{^^J tuc-thesis.cls: Option 5) afivepaper selected ^^J }%
\fi%
\if@letter{%
  \typeout{^^J tuc-thesis.cls: Option 6) letter selected ^^J }%
\fi%
\if@english{%
  \typeout{^^J tuc-thesis.cls: Option 7) english selected ^^J }%
\fi%
\if@tuctitle{%
  \typeout{^^J tuc-thesis.cls: Option 8) tuctitle selected ^^J }%
\fi%
\if@preprint{%
  \typeout{^^J tuc-thesis.cls: Option 9) preprint selected ^^J }%
\fi%
\if@noindent{%
  \typeout{^^J tuc-thesis.cls: Option 10) noindent selected ^^J }%
\fi%


%%% --------------------------------------------------------- &Classes ---
%% 
%% Load the required class
\LoadClass{scrbook}

%%% -------------------------------------------------------- &Packages ---
%%
%% To get all definitions of this style to work, we need some more
%% packages.  They are automatically loaded here.
%%
%% Load the Layer-package
\RequirePackage{scrlayer}

%% 
%% This package contains all definitions, required for the corporate
%% design of Clausthal University.
\RequirePackage[cmyk]{tuc-cd}

%% 
%% This helps to write bachelor-, master-, and PhD-thesises.
\RequirePackage{tuc-thesis}

%% 
%% This is needed, to decide, if some arguments are empty.
\RequirePackage{ifthen}


%%% ------------------------------------------------------ &Definitions ---

%% ......................................................... &Titlepage ...
%% 
%% There should be a special kind of titlepage, showing our logo and
%% different other things.  This command creates the special TUC
%% titlepage as well as the normal titlepage.
%% 
%% First, there is our Logo in the upper left corner of the page
%% (i. e. outside of the textarea!)  The Corporate Design Manual says,
%% the Logo has to be 24 mm high on a DIN A4 paper.  On DIN A5 it
%% should be 17 mm.  On the right hand side of the paper, there shall
%% be a grey border, which is half as wide as the logo high; which is
%% 12 mm on A4paper and 8,5 mm on A5paper.
%% 
%% One should use preprinted paper for this first page, in order to
%% get the logo into the edge of the paper.  If you have to print this
%% on your own printer, you should adapt some correction variables.
%% TUC title makes the titlepage

%% ............................................... &Titlepage-Variables ... 
%% 
%% We doo need some data to be set in the titlepage.  This variable
%% store the data as internal variables.  It is not intended, to use
%% them outside of this scope.
\def\@semester{}%

%% Autor, same as \author
\def\@tucauthor{}%

%% TUCTitle: same as \title
\def\@tuctitle{}%
\def\@tucsubtitle{}%

%% Date: delivery date
\def\@deliverydate{\today}%

%% Define the label to be printed for the censors and the supervisor.
%% This should dapated to the selected language (e.g. babel)
\AtBeginDocument{%
  \iflanguage{english}{%
    \def\@censor@label{Censor}%
    \def\@firstcensor@label{First Censor}%
    \def\@secondcensor@label{Second Censor}%
    \def\@thirdcensor@label{Third Censor}%
    \def\@supervisor@label{Supervisor}}%
  {\def\@censor@label{Gutachter}%
    \def\@firstcensor@label{Erstgutachter}%
    \def\@secondcensor@label{Zweitgutachter}%
    \def\@thirdcensor@label{Drittgutachter}%
    \def\@supervisor@label{Betreuer}}%
}%

%% Censors: who was censoring this thesis.
\def\@firstcensor{}%
\def\@secondcensor{}%
\def\@thirdcensor{}%

%% Supervisor: the supervisors name
\def\@supervisor{}%

%% Thesistype: Bachelor or Masterthesis
\def\@thesistype{Bachelor-Thesis}%

%% TUCinstitute
\def\@tucinstitute{}%


%%  . . . . . . . . . . . . . . . . . . . . . . . . . . &Titlepage-Data . .
%% Define the name of the Institute
\newcommand{\TUCinstitute}[1]{\def\@tucinstitute{#1}}%

%% Define the type of this Thesis.  It should be something like
%% "Bachelorarbeit" or "Master-Thesis" or even "Dissertation".
\newcommand{\TUCthesistype}[1]{\def\@thesistype{#1}}%

%% Define, who is cesonring this thesis.  You can have up to three
%% censors. 
\newcommand{\Firstcensor}[1]{\def\@firstcensor{#1}}%
\newcommand{\Secondcensor}[1]{\def\@secondcensor{#1}}%
\newcommand{\Thirdcensor}[1]{\def\@thirdcensor{#1}}%

%% Define, who supervised this thesis.
\newcommand{\Supervisor}[1]{\def\@supervisor{#1}}%

%% In case, you have to change the default labels
  \newcommand{\censorlabel}[1]{\AtBeginDocument{\def\@censor@label{#1}}}%
  \newcommand{\firstcensorlabel}[1]{\AtBeginDocument{\def\@firstcensor@label{#1}}}%
  \newcommand{\secondcensorlabel}[1]{\AtBeginDocument{\def\@secondcensor@label{#1}}}%
  \newcommand{\thirdcensorlabel}[1]{\AtBeginDocument{\def\@thirdcensor@label{#1}}}%
  \newcommand{\supervisorlabel}[1]{\AtBeginDocument{\def\@supervisor@label{#1}}}%

%% The date, when this thesis was delivered.  If nothing is defined,
%% use the actual date
\def\@tucdate{\today}
\newcommand{\TUCdate}[1]{\def\@tucdate{#1}%
  \date{#1}%
}%

%% The title of this work.
\newcommand{\TUCtitle}[1]{\def\@tuctitle{#1}%
  \title{#1}%
}%
\newcommand{\TUCsubtitle}[1]{\def\@tucsubtitle{#1}%
  \subtitle{#1}%
}%

%% The name of the author.
%% FIXME: it works only with one Author!
\newcommand{\TUCauthor}[1]{\def\@tucauthor{#1}%
  \author{#1}%
}%

%% The term
\newcommand{\semester}[1]{\def\@semester{#1}}%


%% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . &Titlepage . .
%% 
%% This command will set the typical titlepage, containing our logo,
%% the grey bar, your name, institute, type of document, ...
%% TODO: Die Verschiebung funktioniert noch nicht.
%% TODO: Vermutlich auch noch eine zu breite Box.
\newcommand{\makeTUCtitle}{%
  \if@tuctitle%
  \thispagestyle{TUCtitlepagestyle}%
  \if@preprint%
    \thispagestyle{empty}
    \vspace*{\titleskip}%
  \else
    \vspace*{-\logovskip}\hspace*{-\logohskip}%
    \includegraphics[width=\logowidth]{\@logofile}%
    \vspace{\titleskip}%
  \fi                                         % of preprint
    \begin{center}%
      \if\@semester\@empty%
        \large\@thesistype\\[0.8ex]%
      \else%
        \large\@thesistype\\%
        \large\@semester\\[0.8ex]%
      \fi%
      \Large\textbf{\textsf\@tucauthor}\\[5ex]%
      \huge\textbf{\textsf{\@tuctitle%
        \ifthenelse{\equal{\@tucsubtitle}{}}{}{\\[1.2ex]\Large\@tucsubtitle}}}%
    \end{center}%
    \vfill%
    \ifx\@tucinstitute\@empty%
    \else%
    \iflanguage{english}{%
      \@thesistype{} at \@tucinstitute\\[4ex]}%
    {\@thesistype{} vorgelegt beim \@tucinstitute\\[4ex]}%
    \fi%
    \ifx\@secondcensor\@empty%
    \@censor@label: \@firstcensor%
    \else \\
    \@firstcensor@label: \@firstcensor\\%
    \@secondcensor@label: \@secondcensor\fi%
    \ifx\@thirdcensor\@empty%
    \else \\\@thirdcensor@label: \@thirdcensor\fi%
    \ifx\@supervisor\@empty%
    \else \\\@supervisor@label: \@supervisor\fi%
    \iflanguage{english}{%
      \\[3ex]Date of Delivery: \@tucdate}%
    { \\[3ex]Tag der Abgabe: \@tucdate}%
  \else%
    \maketitle%
  \fi
}%




%%% ------------------------------------------------------- &Variables ---


%%% --------------------------------------------------------- &Commands ---



%%% ============================================================= &EOF ===

%%% Local Variables:
%%% mode: LaTeX
%%% TeX-master: "titletest.tex"
%%% TeX-parse-self: t
%%% TeX-auto-save: t
%%% End:


