#!/usr/bin/env python3
#inspired in https://www.practicepython.org/exercise/2014/03/05/05-list-overlap.html
from random import randint, sample

s1 = set(sample(range(1, 10), randint(3,8)))
s2 = set(sample(range(1, 10), randint(3,8)))

print(s1)
print(s2)
print(s1 & s2)
