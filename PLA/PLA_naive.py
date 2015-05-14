# -*- coding: utf-8 -*-
from random import choice 
import numpy as np
import os

data = np.recfromtxt("1_15_train.dat.txt",dtype=np.float64)

signs = lambda x: 0 if x <0 else 1
w_cur = 