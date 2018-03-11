#!/bin/bash

#http://wiki.c2.com/?FizzBuzzTest

for x in {1..100}; do 
  (($x%3 == 0)) && e="Fizz" 
  ((${x}%5 == 0)) && e="${e}Buzz"
  echo "${e:-$x}"
  e=""
done

