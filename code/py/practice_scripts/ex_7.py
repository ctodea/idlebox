#!/usr/bin/env python3
# inspired in https://www.practicepython.org/exercise/2014/03/19/07-list-comprehensions.html
a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
even = list(filter(lambda x: x % 2 == 0, a))
print(even)
