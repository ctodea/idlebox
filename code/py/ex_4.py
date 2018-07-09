#!/usr/bin/env python3
import sys

num = int(input("Input a number: "))
x = range(2, num+1)
divList = []

for i in x:
    if (num % i == 0):
        divList.append(i)
print(divList)
