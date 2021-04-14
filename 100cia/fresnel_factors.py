#!/usr/bin/env python3
import numpy as np
import csv
import os
import cmath
import scipy.constants
import math



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
# IMPORTANT FACT: all arrays are considered to have the same length
loadcsv(caf2, 'caf2.csv', 0)
array_length = len(caf2) # all lengths are the same, we store them
loadcsv(gold_real, 'gold.csv', 0)
loadcsv(gold_img, 'gold.csv', 1)
loadcsv(ps, 'ps.csv', 0)
loadcsv(water_real, 'water.csv', 0)
loadcsv(water_img, 'water.csv', 1)
loadcsv(wavenumber, 'wavenumber.csv', 0)
gold = arrayToComplexArray(gold_real, gold_img)
water = arrayToComplexArray(water_real, water_img)

### end of loading data

wavenumber_k = 10000000 # 10 mil cm^-1

wavelength = [wavenumber_k / x  for x in wavenumber] # lambda = 1/k
frequency = [scipy.constants.c / (x * 10000000000)  for x in wavelength] # frequency = C / lambda
# frequency_sfg = [x for x in frequency_ir] # wavelength -> frequency


def incidentAngleCalc(ni, nj, incident_angle): # incident angle in radians
    #tetha_0 = math.radians(40.636666666) # angle IR in radians
    sin_tetha_0 = cmath.sin(incident_angle)
    return cmath.sqrt(nj**2-ni**2*sin_tetha_0**2)/(nj)

def reflexionP5a(ni,nj,cos_i,cos_j):
    return (nj*cos_i-ni*cos_j)/(nj*cos_i+ni*cos_j)

def reflexionS5b(ni,nj,cos_i,cos_j):
    return (ni*cos_i-nj*cos_j)/(ni*cos_i+nj*cos_j)

def transmissionP5c(ni,nj,cos_i,cos_j):
    return (2*ni*cos_i)/(nj*cos_i+ni*cos_j)

def transmissionS5d(ni,nj,cos_i,cos_j):
    return (2*ni*cos_i)/(ni*cos_i+nj*cos_j)

def beta(wavelength, n2, cos_tetha_2): # formula 6
    d = 100 * 10**(-9) # constant
    return (2* scipy.constants.pi/wavelength)*n2*d*cos_tetha_2

cos_tetha_air_caf2 = []
for i in range(array_length): # iterate any of the two arrays, they happen to have the same length
    cos_tetha_air_caf2.append(incidentAngleCalc(1,caf2[i], 0.70912))

cos_tetha_caf2_ps = []
for i in range(array_length): # iterate any of the two arrays, they happen to have the same length
    cos_tetha_caf2_ps.append(incidentAngleCalc(caf2[i],ps[i],math.acos(cos_tetha_air_caf2[i])))

# cos_tetha_ps_water = []
# for i in range(array_length): # iterate any of the two arrays, they happen to have the same length
#     cos_tetha_ps_water.append(incidentAngleCalc(ps[i],water[i],math.acos(cos_tetha_caf2_ps[i])))

# r_12_p_ir = []
# for i in range(array_length): # iterate any of arrays, they happen to have the same length
#     r_12_p_ir.append(reflexionP5a(caf2[i],ps[i],cos_tetha_air_caf2[i],cos_tetha_caf2_ps[i]))

print(cos_tetha_caf2_ps)


# #lyyInter1 =

# transmission_p = []
