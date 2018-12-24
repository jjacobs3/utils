### List a random set of N files from a directory
ls |sort -R |tail -<N>
# And if you want to do something with them
ls |sort -R |tail -$N |while read file; do
    # Something involving $file, or you can leave
    # off the while to just get the filenames
done

### Convert pdfs to txt
for file in *.pdf; do pdftotext $file ../txt/${file%.pdf}.txt; done

### Compress a pdf file (can change /ebook to /screen for more compression)
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=mon3.pdf monopsony_in_motion.pdf

### Unzip a .tar.xz file
tar xf unpaper-6.1.tar.xz

### Convert pdf to tiff
gs -q -dNOPAUSE -sDEVICE=tiffg4 -sOutputFile=mon.tif monopsony_compressed.pdf -c quit

### To quickly change the extension of a bunch of .txt files to .html

for file in *.txt; do mv "$file" "${file%.txt}.html"; done

### To transform a folder with <num>.pkl into 00<num>.pkl (for example), so that
### everything in the folder is 5 digits and then .pkl

for f in ?.pkl; do mv "$f" "0000$f"; done
for f in ??.pkl; do mv "$f" "000$f"; done
for f in ???.pkl; do mv "$f" "00$f"; done
for f in ????.pkl; do mv "$f" "0$f"; done

### To add a "_en" suffix to every file (keeping the extensions the same!)
rename .pkl _en.pkl *.pkl

### To unzip into a specific directory
unzip <filename>.zip -d <directory>

### To zip a specific directory
zip <filename>.zip <directory or glob string>

### Take a folder of .html files and (try to) parse it into a folder of .txt files
for file in *.html; do w3m -dump "$file" > ${file%.html}.txt; done

### Better way to parse html->txt
# On Windows it's:
type dumb.html | html-to-text --ignore-href=true --ignore-image=true > test.txt

# On Linux:
cat dumb.html | html-to-text --ignore-href=true --ignore-image=true > test.txt

# In a loop:
for file in *.html; do cat $file | html-to-text --ignore-href=true --ignore-image=true > ${file%.html}.txt; done