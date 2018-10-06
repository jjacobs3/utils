# To quickly change the extension of a bunch of .txt files to .html

for file in *.txt; do mv "$file" "${file%.txt}.html"; done

# To transform a folder with <num>.pkl into 00<num>.pkl (for example), so that
# everything in the folder is 5 digits and then .pkl

for f in ?.pkl; do mv "$f" "0000$f"; done
for f in ??.pkl; do mv "$f" "000$f"; done
for f in ???.pkl; do mv "$f" "00$f"; done
for f in ????.pkl; do mv "$f" "0$f"; done

# To add a "_en" suffix to every file (keeping the extensions the same!)

rename .pkl _en.pkl *.pkl

# To unzip into a specific directory

unzip <filename>.zip -d <directory>

# To zip a specific directory

zip <filename>.zip <directory or glob string>