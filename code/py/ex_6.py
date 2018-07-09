#!/usr/bin/env python3
#inspired in https://www.practicepython.org/exercise/2014/03/12/06-string-lists.html
import sys

foo = str(input("Input a word: ")).lower()
# empty string is palindrome
if (foo == foo[::-1]):
    print("Is a palindrome!")
else: print("NOT a palindrome :( ")



