#!/usr/bin/env bash

rm *.xml.gz
rm *_H1.txt
rm *_L1.txt
rm *_V1.txt

TOTALMASS=300.0
NUMRELDATA="/home/c1548640/projects/athena-warp-theory-2/issues/37-pe-3g-analysis/hybrid/q3_-0.5_-0.5_96_400/q3_-0.5_-0.5_96_400-22-hybrid.h5"
MASS1=`python -c "import h5py; f = h5py.File('${NUMRELDATA}'); print(float(${TOTALMASS})*f.attrs['mass1'])"`
MASS2=`python -c "import h5py; f = h5py.File('${NUMRELDATA}'); print(float(${TOTALMASS})*f.attrs['mass2'])"`
SPINS=(`python -c "from __future__ import print_function;import lalsimulation as sim;spins = sim.SimInspiralNRWaveformGetSpinsFromHDF5File(-1, 100.
0, '${h5path}'); print(*spins, sep=' ')"`)

pycbc_generate_hwinj \
--numrel-data /home/c1548640/projects/athena-warp-theory-2/issues/37-pe-3g-analysis/hybrid/q3_-0.5_-0.5_96_400/q3_-0.5_-0.5_96_400-22-hybrid.h5 \
--instruments H1 L1 V1 \
--approximant NR_hdf5 \
--order pseudoFourPN \
--waveform-low-frequency-cutoff 20 \
--low-frequency-cutoff 20 \
--mass1 ${MASS1} \
--mass2 ${MASS1} \
--spin1x ${SPINS[0]} \
--spin1y ${SPINS[1]} \
--spin1z ${SPINS[2]} \
--spin2x ${SPINS[3]} \
--spin2y ${SPINS[4]} \
--spin2z ${SPINS[5]} \
--inclination 0.78 \
--polarization 2.64 \
--ra 1.6486 \
--dec -1.2079 \
--sample-rate H1:4096 L1:4096 V1:4096 \
--taper TAPER_START \
--network-snr 250.0 \
--geocentric-end-time 1186741869 \
--gps-start-time 1186741623 \
--gps-end-time 1186741879 \
--tag 'HWINJ' \
--psd-file \
H1:/home/c1633366/PhenomHM_injection/injection-resources/glitch_median_PSD_forLI_H1.dat \
L1:/home/c1633366/PhenomHM_injection/injection-resources/glitch_median_PSD_forLI_L1.dat \
V1:/home/c1633366/PhenomHM_injection/injection-resources/glitch_median_PSD_forLI_V1.dat
