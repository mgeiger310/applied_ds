import pandas as pd
import numpy as np
import math
import pdb
import random
from math import sqrt



def average(series):
<<<<<<< HEAD:eda_hw.py
    """
    implements the average of a pandas series from scratch
    suggested functions:
    len(list)
    sum(list)
    you should get the same result as calling .mean() on your series
    https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.mean.html
    See numpy documenation for implementation details:
    https://docs.scipy.org/doc/numpy/reference/generated/numpy.mean.html
    """
    x=len(series)
    y=sum(series)
    avg = y/x
    return avg 
    #pass
#print (average([1,2,3,4,5,6,7,8]))
=======

    y = len(series)
    x = sum(series)

    av = x/y
    return(av)
    
>>>>>>> upstream/master:KonstantinosTzo/code.py

def standard_deviation(series):

    r = 0
    aver = average(series)

    for x in range (len(series)):
        k = abs( series[x] - aver)**2
        r = r + k
    
    
    ss = r/(len(series)-1)
    if ss>0 :
        return (sqrt(ss))
    else:
        return(n/a)
    """
    implements the sample standard deviation of a series from scratch
    you may need a for loop and your average function
    also the function math.sqrt
    you should get the same result as calling .std() on your data
    https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.std.html
    See numpy documenation for implementation details:
    https://docs.scipy.org/doc/numpy/reference/generated/numpy.std.html
    """
<<<<<<< HEAD:eda_hw.py
    a = average(series)
    sum=0 
    for i in range(len(series)):
        sum += ((series[i]-a)**2)
    return math.sqrt((sum)/(len(series)-1))

#print(standard_deviation([1,3,8,11,15,17,22]))
    #pass
=======

>>>>>>> upstream/master:KonstantinosTzo/code.py

def median(series):

    l=sorted(series)
    t= len(l)

    if t<1:
        return None
    if t % 2 == 0:
        return (l[int(t/2)] + l[int(t/2)-1]) / 2
    else:
        return l[int((t-1)/2)]
    

    """
    finds the median of the series from scratch
    you may need to sort your values and use
    modular division
    this number should be the same as calling .median() on your data
    See numpy documenation for implementation details:
    https://docs.scipy.org/doc/numpy/reference/generated/numpy.median.html
    https://pandas.pydata.org/pandas-docs/version/0.23.0/generated/pandas.Series.median.html
<<<<<<< HEAD:eda_hw.py
    """
    series=sorted(series)
    if len(series)%2 == 0:
        i=len(series)//2
        me = (series[i-1]+series[i])/2
    else:
        i=len(series)//2 
        me = series[i]
    return me
    
#print(median([1,3,4,6,9,13,14,17]))
=======
    """
>>>>>>> upstream/master:KonstantinosTzo/code.py
