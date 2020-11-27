#!/bin/bash

export OMP_NUM_THREADS=1

mpirun -np 1 lmp < in.lmp

gnuplot plot_energy.gpl
gnuplot plot_msd.gpl
gnuplot plot_rdf_all.gpl
