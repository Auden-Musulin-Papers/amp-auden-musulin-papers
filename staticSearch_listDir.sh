# bin/bash

echo "opend dir"
touch "html/static-search/filenames_auden.txt"
for file in html/static-search/stems/*; do
    echo $file"," >> "html/static-search/filenames_auden.txt"
done