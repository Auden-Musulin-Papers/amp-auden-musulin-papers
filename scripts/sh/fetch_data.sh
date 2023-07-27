# bin/bash

# fetch edition entities all
rm -rf ./data/indices
mkdir ./data/indices
wget https://github.com/Auden-Musulin-Papers/amp-entities/archive/refs/heads/main.zip
unzip main
mv amp-entities-main/out/*.xml ./data/indices
rm -rf amp-entities-main
rm main.zip