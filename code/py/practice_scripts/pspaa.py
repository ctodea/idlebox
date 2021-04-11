#!/usr/bin/python3

# calculate integral between two values for SFG data

from scipy.interpolate import InterpolatedUnivariateSpline
import csv
import numpy as np
import os

values = []

data04 = 'data/04/'
data08 = 'data/08/'

for file in os.listdir(data08):
    full_path = os.path.join(data08, file)
    x_coord = []
    y_coord = []
    exRtFile = open (full_path,'r')
    exchReader = csv.reader(exRtFile, delimiter='\t')
    for column in exchReader:
        if column:
            x_coord.append(column[0])
            y_coord.append(column[1])

    x = np.array(x_coord).astype('float64')
    y = np.array(y_coord).astype('float64')
    y = [x - 300 for x in y]

    f = InterpolatedUnivariateSpline(x, y, k=1)  # k=1 gives linear interpolation
    area = f.integral(641, 645)
    values.append(area)
time = values.copy()
snap_time = 10
i = 0
while i < len(time):
    time[i] = snap_time
    snap_time += 30
    i += 1

print(values)
print()
print(time)
