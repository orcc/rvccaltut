#!/bin/bash

cat ../net.sf.orcc.tutorial/README.md | \
sed -E 's/\[([A-Za-z]*) ([A-Za-z]*) (Tools)\]\(.*\)/\[\1 \2 \3\]\(\#\L\1-\L\2-\L\3\)/g' | \
sed -E 's/([1-9])\. \[([A-Za-z]*)[ ,-]([A-Za-z]*)\]\(.*\)\./\1. [\2 \3]\(\#lesson-\L\1-\L\2-\L\3)./g' | \
sed -E 's/([1-9])\. \[([A-Za-z]*)\]\(.*\)/\1. [\2]\(\#lesson-\L\1-\L\2)/g' | \
sed -E 's/(\[Hello world\])\(.*\)/\1(#lesson-0-hello-world)/g' > Tutorial.md

cat  ../net.sf.orcc.tutorial/Installing_ORCC.md `find ../net.sf.orcc.tutorial/src/ -iname "README.md"|sort` >> Tutorial.md

pandoc --from=markdown_github --to=latex -o Tutorial.pdf Tutorial.md
