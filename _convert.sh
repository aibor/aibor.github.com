#!/bin/bash

IN="_entries/"
OUT="_posts/"
DATEF=""

for ent in "$IN"*; do
  name=$(date --date="@$(basename $ent)" +%Y-%m-%d-%H%M%S.html)
  cat << EOF > "$OUT$name"
---
layout: post
categories: links
---
EOF
  
  sed '$ s/<br>//' "$ent" >> "$OUT$name"
done
