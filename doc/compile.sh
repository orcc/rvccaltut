#!/bin/bash

cat `find ../net.sf.orcc.tutorial/ -iname "README.md"|sort` > Tutorial.md

pandoc --from=markdown_github --to=latex -o Tutorial.pdf Tutorial.md
