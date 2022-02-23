#!/bin/bash
#SBATCH -A snic2022-22-17
#SBATCH -t 0:30:00
#SBATCH -n 4 
#SBATCH -J vaspjob

module load VASP/6.3.0.20012022-omp-nsc1-intel-2018a-eb
#mpprun vasp_std
mpprun vasp_ncl
