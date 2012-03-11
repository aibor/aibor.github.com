#!/bin/bash

for f in 201*.html; do
  date=$(sed -r 's/(.{10})-(.{2})(.{2})(.{2})/\1 \2:\3:\4/' <<< ${f%.html})
    #sed -i '4i date: '"$date" $f
    sed -ri '4 s/(.*)/\1-01:00/' $f
done
