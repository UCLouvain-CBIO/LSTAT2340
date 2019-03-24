make all:
	make LSTAT2340-prot.pdf
	make LSTAT2340-prot.html
	make docs/index.html

LSTAT2340-prot.pdf: LSTAT2340-prot.Rmd
	Rscript -e 'rmarkdown::render("LSTAT2340-prot.Rmd", output_format = tufte::tufte_handout())'

LSTAT2340-prot.html: LSTAT2340-prot.Rmd
	Rscript -e 'rmarkdown::render("LSTAT2340-prot.Rmd", output_format = tufte::tufte_html())'

docs/index.html: LSTAT2340-prot.html
	cp LSTAT2340-prot.html docs/index.html


clean:
	rm -r LSTAT2340-prot.log
	rmdir LSTAT2340-prot_files
