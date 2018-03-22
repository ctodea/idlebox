#!/bin/bash

#http://wiki.c2.com/?FizzBuzzTest

for i in {1..100}; do
  e=""
  (( $i % 3 == 0 )) && e="Fizz" 
  (( $i % 5 == 0 )) && e="${e}Buzz"
  echo ${e:-$i}
done

