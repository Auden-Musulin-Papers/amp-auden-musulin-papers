# bin/bash

echo "opend dir"
rm "html/static-search/filenames_auden.txt"
touch "html/static-search/filenames_auden.txt"
for file in html/static-search/stems/*; do
    echo $file"," >> "html/static-search/filenames_auden.txt"
done