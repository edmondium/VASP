#!/bin/bash
#SBATCH -A snic2022-22-17  
#SBATCH -t 0:30:00
#SBATCH -n 4 
#SBATCH -J vaspjob

module load VASP/6.3.0.20012022-omp-nsc1-intel-2018a-eb

for i in  3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 ; do
mkdir -p $i
cd $i
cp /software/sse/manual/vasp/POTCARs/PBE/2015-09-21/Si/POTCAR .
cp /software/sse/manual/vasp/training/ws2022/fcc_Si/INCAR .
cp /software/sse/manual/vasp/training/ws2022/fcc_Si/KPOINTS .
cat >POSCAR <<!
fcc:
   $i
 0.5 0.5 0.0
 0.0 0.5 0.5
 0.5 0.0 0.5
Si
   1
cartesian
0 0 0
!
mpprun vasp_std
E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>../SUMMARY.fcc
cd ..
done

