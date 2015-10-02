#!/bin/bash
read -r -p 'Enter Log Directory (dont put / at the end of the directory name): ' directory
read -r -p 'Enter XML dump location (dont put / at the end of the directory name): ' dumploc
ls "$directory" > ./data1.dat
sed -n 's/\.evtx//gpw data2.dat' data1.dat
sed -n 's/\ /\\ /gpw data.dat' data2.dat
#rm data1.dat
#rm data2.dat
while read line
do
	./evtxdump.pl "$direcory"/"$line".evtx > "$dumploc"/"$line".xml 
done < data.dat
