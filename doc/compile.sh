#!/bin/bash

cat ../net.sf.orcc.tutorial/README.md ../net.sf.orcc.tutorial/Installing_ORCC.md `find ../net.sf.orcc.tutorial/src/ -iname "README.md"|sort` > Tutorial.md

pandoc --from=markdown_github --to=latex -o Tutorial.pdf Tutorial.md
