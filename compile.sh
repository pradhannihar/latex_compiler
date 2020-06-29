#!/bin/sh
#Put the name of the tex file without quote in place of thesis
FILE_NAME=thesis
echo "============== Compiling tex file  $FILE_NAME ============== "
pdflatex $FILE_NAME.tex
bibtex $FILE_NAME.aux
pdflatex $FILE_NAME.tex
pdflatex $FILE_NAME.tex
makeindex -s nomencl.ist -o $FILE_NAME.nls $FILE_NAME.nlo
pdflatex $FILE_NAME.tex
echo "============== Compiling tex file  $FILE_NAME done  =============="

read -p "Enter yes(y) or no for commiting the modification" var
if [ "$var" = "y" ];
then 
	git add .
	git commit -m "Just a commit" .
	echo 'Modifiation committed !!!!'
else
	echo "Uncommitted modification !!!"
fi
mkdir -p ../Report_backup
cp -R * ../Report ../Report_backup

echo "=============  Backup of report done 😃️ ============= "
evince $FILE_NAME.pdf

