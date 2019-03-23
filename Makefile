make all:
	make LSTAT2340-prot.pdf
	make LSTAT2340-prot.html

LSTAT2340-prot.pdf: LSTAT2340-prot.Rmd
	Rscript -e 'rmarkdown::render("LSTAT2340-prot.Rmd", output_format = tufte::tufte_handout())'

LSTAT2340-prot.html: LSTAT2340-prot.Rmd
	Rscript -e 'rmarkdown::render("LSTAT2340-prot.Rmd", output_format = tufte::tufte_html())'
