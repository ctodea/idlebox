#!/usr/bin/env python3
# inspired in https://www.practicepython.org/exercise/2014/02/15/03-list-less-than-ten.html

fn = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
bar = input("Input number: ")

f = list(filter(lambda x: x < int(bar), fn))

print(f)