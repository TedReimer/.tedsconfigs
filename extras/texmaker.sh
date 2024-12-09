pdflatex $1.tex;
rm $1.aux;
rm $1.log;
mv $1.pdf pdfs/;
