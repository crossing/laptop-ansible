#!/usr/bin/env bash

OUT=$(mktemp -d)
SCANNER=$(scanimage -f "%d%n" | grep HP)

clean() {
    rm -rf $OUT
}
trap clean EXIT

scan() {
    start=$1
    increment=$2
    scanimage -d $SCANNER \
              --format=tiff \
              --batch=$OUT/%d.tiff \
              --batch-start=$start \
              --batch-increment=$increment \
              --batch-print \
              --progress \
              --source=ADF \
              --mode=Color \
              --resolution=300
}

pdf() {
    files=$(ls -v -d $OUT/* | xargs)
    eval "convert $files -fuzz 1% -trim +repage output.pdf"
    convert -density 300 -quality 5 -compress jpeg output.pdf output.pdf
}

run() {
    scan 1 2
    read -n 1 -s -r -p "Now scanning the other sides, load document and press any key to continue ..."

    pages=$(ls $OUT/ | wc -l)
    scan $(($pages * 2)) -2

    pdf
}

run
