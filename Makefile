NAME=pdf
LATEX_FLAGS=-shell-escape
CLEAN_FILES+=$(NAME).ptc $(NAME).pyg
VIEWPDF=xdg-open

include /usr/local/latex-mk/share/latex-mk/latex.gmk
