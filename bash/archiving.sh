
# Check if two files are the same. From
# https://stackoverflow.com/questions/12900538/fastest-way-to-tell-if-two-files-are-the-same-in-unix-linux
cmp --silent $old $new || echo "files are different"