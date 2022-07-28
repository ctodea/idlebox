#!/usr/bin/env python3
from itertools import combinations_with_replacement
import numpy as np

wave_length = []
c = 3*10**17  # nm/s
n = int(input("Enter number of elements: "))
target = c/640
# target = 10
# iterating till the range
for i in range(0, n):
    ele = int(input("Input value:"))
    wave_length.append(ele)  # adding the element
    wave_length.append(-ele)  # unefficiently calculation subs too

freqs = [c/x for x in wave_length]

combs = ([comb for comb in combinations_with_replacement(freqs, 3)])
sums = np.array([sum(i) for i in combs])

difference_array = np.absolute(sums-target)
index = difference_array.argmin()
print(combs[index])
print(sums[index])
print(target)
