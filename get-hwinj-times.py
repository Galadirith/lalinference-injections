#!/usr/bin/env python

import numpy as np
from os.path import basename
from glob import glob
import re
import sys

# Get parameterized sample rate and injection data filename
sample_rate = int(sys.argv[1])
filename = glob('./*{0:s}.txt'.format(sys.argv[2]))[0]

# Find the number of time samples
samples = sum(1 for line in open(filename, 'r'))
duration = samples/sample_rate

# Derive a start time that approximatley centers the injection in the frame
# Burn the frame duration to 1024 for right now
hwinj_start_time = int(basename(filename).split('_')[1])
gps_start_time = hwinj_start_time + int(duration/2) - 512
gps_end_time = gps_start_time + 1024

print("{0:d} {1:d} {2:d}".format(
    gps_start_time, hwinj_start_time, gps_end_time))
