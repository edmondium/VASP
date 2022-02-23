#!/bin/bash
#SBATCH -A snic2022-22-17  
#SBATCH -t 0:30:00
#SBATCH -n 4 
#SBATCH -J vaspjob

module load VASP/6.3.0.20012022-omp-nsc1-intel-2018a-eb

for i in 5.1 5.2 5.3 5.4 5.5 5.6 5.7 ; do
mkdir -p $i
cd $i
cp /software/sse/manual/vasp/POTCARs/PBE/2015-09-21/Si/POTCAR .
cp /software/sse/manual/vasp/training/ws2022/cd_Si/INCAR .
cp /software/sse/manual/vasp/training/ws2022/cd_Si/KPOINTS .
cat >POSCAR <<!
cubic diamond Si
   $i 
 0.0    0.5     0.5
 0.5    0.0     0.5
 0.5    0.5     0.0
Si
  2
Direct
 -0.125 -0.125 -0.125
  0.125  0.125  0.125
!
mpprun vasp_std
E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>../SUMMARY.dia
cd ..
done

