#!/bin/bash -ue
rm -f angle_dist.dat
for i in `seq 1 8`; do cat pdbs/angle_dist_${i}.tmp >> angle_dist.dat;done

