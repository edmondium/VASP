#!/bin/bash
#SBATCH -A snic2022-22-17  
#SBATCH -t 0:30:00
#SBATCH -n 4 
#SBATCH -J vaspjob

module load VASP/6.3.0.20012022-omp-nsc1-intel-2018a-eb

for i in 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 ; do
mkdir -p $i
cd $i
cp /software/sse/manual/vasp/POTCARs/PBE/2015-09-21/Ni/POTCAR .
cp /software/sse/manual/vasp/training/ws2022/fcc_Ni/INCAR .
cp /software/sse/manual/vasp/training/ws2022/fcc_Ni/KPOINTS .
cat >POSCAR <<!
fcc Ni
   $i 
 0.5 0.5 0.0
 0.0 0.5 0.5
 0.5 0.0 0.5
Ni
   1
cartesian
0 0 0
!
mpprun vasp_std
E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>../SUMMARY.fcc
cd ..
done

