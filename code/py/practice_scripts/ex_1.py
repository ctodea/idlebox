#!/usr/bin/env python3
#inspired in https://www.practicepython.org/exercise/2014/01/29/01-character-input.html
import sys
import datetime
import re

day = 0 
month = 0 
year = 0 
today = datetime.date.today()

#returns True is date is past and existed (leap years, etc)
def dateValidation(date_):
    #https://pythex.org/
    #"?:" to manage groups
    #regex that validates DD/MM/YYYY format 
    dateRegex = "((?:0[0-9])|(?:[1-2][0-9])|(?:3[0-1]))\/((?:0[1-9])|(?:1[0-2]))\/(\d{4})"
    try:
        if re.match(dateRegex, date_):
            #globals: https://stackoverflow.com/a/423596/3763807
            global day
            day = int(re.match(dateRegex, date_).group(1))

            global month
            month = int(re.match(dateRegex, date_).group(2))

            global year
            year = int(re.match(dateRegex, date_).group(3))
            #print("day is {}, the month is {}, the year is {}".format(day, month, year))
            try:
                if not datetime.datetime(year, month, day) \
                    or (year, month, day) > (today.year, today.month, today.day) : # validate if date existed
                    raise ValueError
            except ValueError:
                print("That day never existed (yet), you liar!")
                sys.exit(1)
        else:
            raise ValueError
    except ValueError:
        print("Date format not correct, must be DD/MM/YYYY")
        sys.exit(2)
    return True


def calculateAge():
    birthday = input("Input your birthday (DD/MM/YYYY): ")
    if dateValidation(birthday):
        #Python's black magic: True = 1, False = 0
        #https://stackoverflow.com/a/2764099/3763807
        age = today.year - year - ((today.month, today.day) < (month, day))
        print("You're {} years old".format(age))
        print("You'll be 100 years old in {}".format(year+100))


if __name__ == "__main__":
    calculateAge()

