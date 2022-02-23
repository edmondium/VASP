#!/bin/bash
for i in 5.1 5.2 5.3 5.4 5.5 5.6 5.7  ; do
cd $i
V=`awk '/volume/ {print $3; exit}' vasprun.xml`
E=`awk '/F=/ {print $3}' OSZICAR`  
echo $V $E  >>../vol_etot.dat
cd ..
done    

