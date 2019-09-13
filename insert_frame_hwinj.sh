#!/usr/bin/env bash

HWINJ_TIMES=($(/home/c1633366/PhenomHM_injection/injection-resources/get-hwinj-times.py 2048 H1))

rm *_H1.gwf
H1_HWINJ_FILE=(*H1.txt)
H1_OUTPUT_FILE=H-${H1_HWINJ_FILE%.txt}.gwf
pycbc_insert_frame_hwinj \
--gps-start-time ${HWINJ_TIMES[0]} \
--gps-end-time ${HWINJ_TIMES[2]} \
--sample-rate 2048 \
--hwinj-file $H1_HWINJ_FILE  \
--hwinj-start-time ${HWINJ_TIMES[1]} \
--ifo H1 \
--output-file $H1_OUTPUT_FILE \
--fake-strain zeroNoise \
--low-frequency-cutoff 20

rm *_L1.gwf
L1_HWINJ_FILE=(*L1.txt)
L1_OUTPUT_FILE=L-${L1_HWINJ_FILE%.txt}.gwf
pycbc_insert_frame_hwinj \
--gps-start-time ${HWINJ_TIMES[0]} \
--gps-end-time ${HWINJ_TIMES[2]} \
--sample-rate 2048 \
--hwinj-file $L1_HWINJ_FILE  \
--hwinj-start-time ${HWINJ_TIMES[1]} \
--ifo L1 \
--output-file $L1_OUTPUT_FILE \
--fake-strain zeroNoise \
--low-frequency-cutoff 20

rm *_V1.gwf
V1_HWINJ_FILE=(*V1.txt)
V1_OUTPUT_FILE=V-${V1_HWINJ_FILE%.txt}.gwf
pycbc_insert_frame_hwinj \
--gps-start-time ${HWINJ_TIMES[0]} \
--gps-end-time ${HWINJ_TIMES[2]} \
--sample-rate 2048 \
--hwinj-file $V1_HWINJ_FILE  \
--hwinj-start-time ${HWINJ_TIMES[1]} \
--ifo V1 \
--output-file $V1_OUTPUT_FILE \
--fake-strain zeroNoise \
--low-frequency-cutoff 20

/home/c1633366/PhenomHM_injection/injection-resources/get-times.py H1
