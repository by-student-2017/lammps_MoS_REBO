#!/bin/bash

export OMP_NUM_THREADS=1

mpirun -np 1 lmp < in.elastic

python3 compliance_python3.py
