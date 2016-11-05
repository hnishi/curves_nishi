#!/bin/bash


mkdir -p ./pdbs
cd ./pdbs
trjconv -s ../../md1_ini_dna_nojump.gro -f ../../md1_50001fr_dna_nojump.xtc -o conf.pdb -sep <<< 'DNA'
cd ..

#conf0.gro - conf50000.gro

