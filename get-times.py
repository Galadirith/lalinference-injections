#!/usr/bin/env python

import numpy as np
from pycbc import frame
from glob import glob
import sys

filename = glob('./*{0:s}.gwf'.format(sys.argv[1]))[0]
data = frame.read_frame(
    filename, '{0:s}:HWINJ_INJECTED'.format(sys.argv[1]))

idx_max = np.argmax(np.abs(data.numpy()))
time = data.get_sample_times().numpy()[idx_max]

with open('./time.txt', 'w+') as f:
    f.write('{0:.2f}'.format(time))
