# bin/bash

echo "create file filenames_auden.txt"
touch "../static-search/filenames_auden.txt"
echo "opend dir ../static-search/stems"
for file in ../static-search/stems/*; do
    echo $file >> "../static-search/filenames_auden.txt"
done
echo "filenames_auden.txt in ../static-search created"