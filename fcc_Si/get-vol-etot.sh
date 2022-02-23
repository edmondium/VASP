#!/bin/bash
for i in  3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 ; do
cd $i
V=`awk '/volume/ {print $3; exit}' vasprun.xml`
E=`awk '/F=/ {print $3}' OSZICAR`  
echo $V $E  >>../vol_etot.dat
cd ..
done    

