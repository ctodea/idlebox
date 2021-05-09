#!/usr/bin/env python3
import numpy as np
import csv
import os
import cmath
import scipy.constants
import math



### loading data
def loadcsv(array, csv_file, column_number):
    exRtFile = open(csv_file,'r')
    exchReader = csv.reader(exRtFile)
    for column in exchReader:
        if column:
            array.append(column[column_number])
    return array

data = '/home/ctodea/Documents/exportUser_2021-2-19.csv'
arr = []

res = loadcsv(arr, data, 2)

print(res)
