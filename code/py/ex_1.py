#!/usr/bin/python3
import sys
from datetime import date
import re

def main():
    age = input("How old are you? [0-100] ")
    if int(age) > 0:
        celebrated = input("Have you alredy celebrated your birthday this year? (y/n) ")
        if not re.match("[yYnN]{1}", str(celebrated)) or not re.match("[0-100]", str(age)):
            print("invalid input")
            sys.exit
    else:
        print("You'll be 100 years old in " + (date.year + 100) )
    #
    #curr_year = datetime.year
    #
    #birthday_year = curr_year - age
    #print("You were born in " + str(birthday_year))
    #calculate which year you'll be 100 years old

    #getting input 2 -> n

    #print line every enter, max n times 

main()
