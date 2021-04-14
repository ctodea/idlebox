#!/usr/bin/env python3
import numpy as np
import csv
import os
import cmath
import scipy.constants as constants

### loading data
def loadcsv(array, csv_file, column_number):
    data = '/home/ctodea/git/idlebox/100cia/data/'
    exRtFile = open (data + csv_file,'r')
    exchReader = csv.reader(exRtFile)
    for column in exchReader:
        if column:
            array.append(float(column[column_number]))
    return array

def arrayToComplexArray(array_real, array_img): # we consider both arrays are same the same length
    result = []
    for i in range(len(array_real)):
        result.append(complex(array_real[i],array_img[i]))
    return result


caf2 = []
gold_real = []
gold_img = []
ps = []
water_real = []
water_img = []
wavenumber = []

loadcsv(caf2, 'caf2.csv', 0)
loadcsv(gold_real, 'gold.csv', 0)
loadcsv(gold_img, 'gold.csv', 1)
loadcsv(ps, 'ps.csv', 0)
loadcsv(water_real, 'water.csv', 0)
loadcsv(water_img, 'water.csv', 1)
loadcsv(wavenumber, 'wavenumber.csv', 0)
gold = arrayToComplexArray(gold_real, gold_img)
water = arrayToComplexArray(water_real, water_img)

### end of loading data

wavenumber_k = 10000000 # 10 mil

wavelength_ir = [wavenumber_k / x  for x in wavenumber] # wavenumber -> wavelength
frequency_ir = [constants.c / (x * 10000000000)  for x in wavelength_ir] # wavelength -> frequency
frequency_sfg = [x for x in frequency_ir] # wavelength -> frequency
