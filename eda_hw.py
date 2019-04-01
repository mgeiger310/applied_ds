import pandas as pd
import numpy as np
import math
import pdb

def average(series):
    
    avg = sum(series)/len(series)
    return avg
pass

def standard_deviation(series):
    
    total = 0
    for i in series:
        total = total + (i - average(series)) ** 2
    return math.sqrt(total / (len(series)-1))
pass    

def median(series):
   
    proper = sorted(series)
    if len(proper)%2 == 0:
        i = len(proper)//2
        median = (proper[i] + proper[i-1])/2
    else:
        i = len(proper)//2
        median = proper[i-1]
    return median
pass    

