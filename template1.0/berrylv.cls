\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{berrylv}[2024/06/05 berrylv class]
% ctexbook中文书籍
% zihao=-4：设置正文的字号为小四号
% a4paper：设置页面大小为A4纸张
% twoside：启用双面打印格式，即左右页边距会根据奇偶页不同而设置
% openright：在双面打印时，新的一章会从右侧页开始
% UTF8：指定文档采用 UTF-8 编码格式
% space=auto：根据中文习惯自动调整英文与数字之间的间距
\LoadClass[
	zihao=-4,
	a4paper,
	twoside,
	openright,
	UTF8,
	space=auto,
]{ctexbook}


\renewcommand{\contentsname}{目录}


%% 加载宏包

%% 数学公式&符号
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
%% 直立希腊字母字体
\RequirePackage{upgreek}
%% \XeTeX Logo
\RequirePackage{xltxtra}    
\RequirePackage{hologo}
\RequirePackage{etoolbox}   % 给宏包打补丁
\RequirePackage{xparse}     % 用于生成文档级命令的高级接口
\RequirePackage{notoccite}  % 目录引用
\RequirePackage{ifthen}     % 选择编译
\RequirePackage{ifpdf}      % 检查pdfTeX模式
\RequirePackage{fancyhdr}	% 页眉页脚控制
\RequirePackage{ulem}       % 下划线控制
\RequirePackage{indentfirst}% 首行缩进

% 引用geometry宏包设置纸张和页面
\usepackage[
	paper=a4paper,
	top=2.5cm, % 上2.5cm
	bottom=2.5cm, % 下2.5cm
	left=2.7cm, % 左2.7cm
	right=2.7cm, % 右2.7cm
	headheight=0.5cm, % 页眉 2cm
	footskip=0.7cm % 页脚1.8cm
]{geometry}
\RequirePackage{setspace}   % 设置行间距
\RequirePackage{titletoc}   % 目录格式
%% 复杂插图
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{wrapfig}
\RequirePackage{caption}
\RequirePackage{bicaption}
\RequirePackage{float}   
%% 复杂表格
\RequirePackage{threeparttable}  % 表格尾注
\RequirePackage{longtable}       % 跨页表格
\RequirePackage{dcolumn}
\RequirePackage{array}
\RequirePackage{multirow}        % 跨长的表格单元格
\RequirePackage{multicol}
\RequirePackage{makecell}        % 许多方便的表格控制
\RequirePackage{diagbox}         % 斜线表头
\RequirePackage{booktabs} 
% 对引文进行排序和压缩
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\RequirePackage{xcolor}     % 颜色宏包
\RequirePackage{listings}   % 源代码
% pdf书签
\RequirePackage{hyperref}
\RequirePackage{enumitem}   % 列表宏包
\RequirePackage{wasysym}    % 提供特殊符号
\RequirePackage{pifont}     % 提供带圈数字符号
\RequirePackage{hypernat}   % 解决natbib和hyperref兼容性
\RequirePackage{tabularx}   % 支持扩展的列宽
\RequirePackage{makeidx}    % 支持建立索引
\RequirePackage{glossaries} % 制作术语表
\RequirePackage[version=4]{mhchem}  % 提供化学符号
\RequirePackage{siunitx}
\RequirePackage{lipsum}
% 设置封面
\RequirePackage{titling}
\RequirePackage{framed}
% 算法代码相关
\RequirePackage{algorithmicx,algorithm}
% 算法伪代码
\RequirePackage[noend]{algpseudocode}

% 天蓝色
\definecolor{shadecolor}{HTML}{87ceeb}


% 英文字体使用 Times New Roman
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Consolas}


% Clear Double Page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\thispagestyle{empty}%
	\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% 设置行距为20磅
% \setstretch{1.38}

\linespread{1.5}

% 设置段落间距
\setlength{\parskip}{0pt}    

% 设置章节标题标号最多到第4层(\subsubsection)，超过第四层的章节不再自动编号
\setcounter{secnumdepth}{4}

\ctexset{
	part/format += \color[HTML]{1661ab},
}
% 设置章节格式，黑体小二号加粗居中，行距20磅
% 间距设定为段前7.5磅，段后7.5磅
% 章序号与章名间空一格
\ctexset{chapter={
		name = {第,章},
		number = {\chinese{chapter}},
		format = {\centering \rmfamily \heiti \zihao{-2} \color[HTML]{1661ab}},
		pagestyle = {berrylv@headings},
        aftername = {\enspace},
        beforeskip= {16pt},
		afterskip = {16pt},
		fixskip = true,
	}
}

% 设置一级章节标题格式
% 黑体三号，左对齐，行距20磅
% 间距设定为段前6磅，段后6磅
% 序号与题目间空一格
\ctexset{section={
		format={\raggedright \rmfamily \heiti \zihao{3} \color[HTML]{1661ab}},
        aftername = {\enspace},
		beforeskip = {16pt},
		afterskip = {16pt},
		fixskip = true,
	}
}

% 设置二级章节标题样式
% 黑体小三号，左对齐，行距20磅
% 间距设定为段前6磅，段后3磅
% 序号与题名空一格
\ctexset{subsection={
		format={\raggedright \rmfamily \heiti \zihao{-3} \color[HTML]{1661ab}},
        aftername = {\enspace},
		beforeskip = {16pt},
		afterskip = {12pt},
		fixskip=true,
	}
}

% 设置三级章节标题样式
% 仿宋四号，左对齐，行距20磅
% 间距设定为段前3磅，段后0磅
% 序号与题名空一格
\ctexset{subsubsection={
		format={\raggedright \rmfamily \fangsong \zihao{4} \color[HTML]{1661ab}},
        aftername = {\enspace},
		beforeskip = {12pt},
		afterskip = {12pt},
		fixskip=true,
	}
}

% 设置目录深度最多到第2层
\setcounter{tocdepth}{2}

% 设定目录格式
\addtocontents{toc}{\protect\hypersetup{hidelinks}}

% 设置目录格式
\titlecontents{chapter}[0pt]{\heiti \zihao{-4} \color[HTML]{1661ab}}
    {\thecontentslabel\hspace{0.5\ccwd}}{}
    {\hspace{.5em}\titlerule*{·}\contentspage}
\titlecontents{section}[\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{0.5\ccwd}}{}
    {\hspace{.5em}\titlerule*{$\cdots$}\contentspage}
\titlecontents{subsection}[2\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{0.5\ccwd}}{}
    {\hspace{.5em}\titlerule*{$\cdots$}\contentspage}

\titlecontents{figure}[0pt]{\songti \zihao{-4}}
{\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\songti \zihao{-4}}
{\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.}\contentspage}


% 空白页眉页脚
\fancypagestyle{berrylv@empty}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\let\Oldpart\part
\newcommand{\parttitle}{}
\renewcommand{\part}[1]{\Oldpart{#1}\renewcommand{\parttitle}{\CTEXthepart\quad#1}}
\fancypagestyle{berrylv@headings}{
	\fancyhf{}
	% 设置页眉格式
	\fancyhead[LE]{\thepage\quad\parttitle} % 左页眉、偶数页、部分标题
	\fancyhead[RO]{\leftmark\quad\thepage} % 右页眉、奇数页、章标题
}

% 对于openright选项，必须保证章页右开，且如果前章末页没有内容需只保留其页眉页脚
\let\berrylv@cleardoublepage\cleardoublepage
\newcommand{\berrylv@clearemptydoublepage}{
	\clearpage{\pagestyle{berrylv@empty}\berrylv@cleardoublepage}}
\let\cleardoublepage\berrylv@clearemptydoublepage

% 修改frontmatter的页码为大写罗马格式，并调整页面风格
\renewcommand{\frontmatter}{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{berrylv@headings}
}
% 修改mainmatter的页码为阿拉伯格式
\renewcommand{\mainmatter}{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{berrylv@headings}
}

% 设置浮动体与正文文字之间的距离
\setlength{\floatsep}{6pt}      % 浮动体之间的间距
\setlength{\textfloatsep}{6pt}  % 处于b或t位置的浮动体和文字间距
\setlength{\intextsep}{6pt}     % 处于文字之中h的浮动体和文字间距
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}

% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 设置列表格式
\newcolumntype{d}[1]{D{.}{.}{#1}}
% 表格内转行
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% 设置图表标题选项，标题字体大小为五号字
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
	font = {fontsize},
	labelsep = zhspace,
}
\captionsetup[table][bi-second]{name=Table}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table]{
    labelfont = bf,
    textfont = bf,
    position = top,
	aboveskip = {6bp},
	belowskip = {6bp},
}
\numberwithin{table}{section}
\captionsetup[figure]{
    labelfont = bf,
    textfont = bf,
    position = bottom,
	aboveskip = {6bp},
	belowskip = {6bp},
}

% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png,.jpeg,.bmp}
\graphicspath{{figures/}}   % 定义图表默认路径

% 定义公式、图、表编号的形式“C.S.N”
\renewcommand\theequation{\arabic{chapter}.\arabic{section}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{section}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{section}.\arabic{table}}


% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% 获取引用文件
\def\berrylv@getfileinfo#1 #2 #3\relax#4\relax{
  \def\berrylvfiledate{#1}
  \def\berrylvfileversion{#2}
  \def\berrylvfileinfo{#3}}
\expandafter\ifx\csname ver@berrylvz.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_berrylvz.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@berrylvz.cls\endcsname}
\fi
\expandafter\berrylv@getfileinfo\reserved@a\relax? ? \relax\relax

% 引用超链接
\hypersetup{
	bookmarksnumbered,
	linktoc=all,
	colorlinks=true,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	linkbordercolor=black,
	urlcolor=black,
	plainpages=false,
	pdfstartview=FitH
}

% 设置列表缩进符合中文环境
\setenumerate{
    fullwidth,
    topsep= 0pt,                % 列表顶部与之前内容的额外空白
    itemindent=\parindent,      % 每个item第一行的缩进
    listparindent=\parindent,   % 每一个item第一行之后隔行的缩进
    itemsep=0ex,                % 列表各项之间的额外垂直空白
    partopsep=0pt,              % 如果列表之前是一个空行，列表顶部的额外空白
    parsep=0ex                  % item中，如果分段，段落间的额外空白
}

% 设置无序列表的标签符号
\setlist[itemize,1]{label=$\medbullet$}
\setlist[itemize,2]{label=$\balcksquare$}
\setlist[itemize,3]{label=$\Diamondblack$}

% listings 源代码显示
\lstset{
	numbers=left, % 行号
	basicstyle=\ttfamily, % 字体
	stringstyle=\ttfamily, % 代码字符串的特殊格式
	showstringspaces=false, % 不显示代码字符串中间的空格标记
	frame=single, % 边框样式
	tabsize=4, % tab长度
	keywordstyle=\color{blue}\bfseries, % 关键字风格
	commentstyle=\it\color[RGB]{0,100,0}, % 注释为绿色
	breaklines = true, %对过长的代码自动换行
	breakautoindent = true, %
	breakindent = 4em, %
	extendedchars=false, % 解决代码跨页时,章节标题,页眉等汉字不显示的问题
	columns=flexible, % 代码紧凑
}
\renewcommand{\lstlistingname}{代码} % 重命名Listings标题头


% 论文封面的可用命令
\renewcommand\title[1]{\def\berrylv@value@title{#1}}
\renewcommand\author[1]{\def\berrylv@value@author{#1}}

% 生成封面
\newcommand\makecover{
	\pdfbookmark[0]{封面}{cover}
	\begin{titlepage}
		\newgeometry{margin = 0in}
		\parindent=0pt
		\includegraphics[width=\linewidth]{cover}
		\vfill
		\begin{center}
			\parbox{0.7\textwidth}{
				\hfill {\kaishu \bfseries \zihao{0} \berrylv@value@title} \\[0.6pt]  
				\rule{0.7\textwidth}{4pt} \\ 
			}
		\end{center}
		\vfill
		\begin{center}
			\parbox{0.618\textwidth}{
				\hfill\Large\kaishu
				\begin{tabular}{r|}
					\berrylv@value@author \\
				\end{tabular}
			}
		\end{center}
		\vfill
		\begin{center}
			\parbox[t]{0.7\textwidth}{\centering}
		\end{center}
		\vfill
	\end{titlepage}
	\restoregeometry
}

% 下一页从偶数页开始
\newcommand\beginatevenpage{
    \clearpage
    \if@twoside
        \thispagestyle{berrylv@empty}
        \cleardoublepage
    \fi
}

% 目录
\renewcommand\tableofcontents{%
    \if@twocolumn
    \@restonecoltrue\onecolumn
    \else
    \@restonecolfalse
    \fi
    \chapter*{\contentsname}
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
    \pdfbookmark[0]{目录}{bittoc}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
}

% 参考文献
\renewenvironment{thebibliography}[1]
     {\zihao{-4}
      \chapter*{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
      \addcontentsline{toc}{chapter}{参考文献}
      \list{\@biblabel{\@arabic\c@enumiv}}
           {\settowidth\labelwidth{\@biblabel{#1}}
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \linespread{1.5}
            \setlength{\parsep}{-0.5mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}
      \endlist}     

% 文档结束
\endinput