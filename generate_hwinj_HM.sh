#!/usr/bin/env bash

rm *.xml.gz
rm *_H1.txt
rm *_L1.txt
rm *_V1.txt
pycbc_generate_hwinj \
--instruments H1 L1 V1 \
--approximant IMRPhenomHM \
--order pseudoFourPN \
--waveform-low-frequency-cutoff 20 \
--low-frequency-cutoff 20 \
--mass1 24.497549250297265 \
--mass2 2.7205805685006497 \
--spin1x 0.0 \
--spin1y 0.0 \
--spin1z 0.0 \
--spin2x 0.0 \
--spin2y 0.0 \
--spin2z 0.0 \
--inclination 0.9462142777592893 \
--polarization 0.5151455383622275 \
--ra 0.2307340265745295 \
--dec -0.4343661173603828 \
--sample-rate H1:2048 L1:2048 V1:2048 \
--taper TAPER_START \
--network-snr 25.0 \
--geocentric-end-time 1249852256.991717 \
--gps-start-time 1249851715 \
--gps-end-time 1249852276 \
--tag 'HWINJ' \
--psd-file \
H1:/cvmfs/ligo-containers.opensciencegrid.org/lscsoft/conda/latest/envs/ligo-py36/share/lalsimulation/LIGO-T0900288-v3-ZERO_DET_high_P.txt \
L1:/cvmfs/ligo-containers.opensciencegrid.org/lscsoft/conda/latest/envs/ligo-py36/share/lalsimulation/LIGO-T0900288-v3-ZERO_DET_high_P.txt \
V1:/cvmfs/ligo-containers.opensciencegrid.org/lscsoft/conda/latest/envs/ligo-py36/share/lalsimulation/LIGO-P1200087-v18-AdV_DESIGN.txt
