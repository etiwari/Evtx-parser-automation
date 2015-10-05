#!/bin/bash
read -r -p 'Enter Log Directory (dont put / at the end of the directory name): ' directory
read -r -p 'Enter XML dump location (dont put / at the end of the directory name): ' dumploc
ls "$directory" > ./data.dat
sed -i 's/\.evtx//g' data.dat
sed -i 's/\ /\\ /g' data.dat
while read line
do
	./evtxdump.pl "$directory"/"$line".evtx > "$dumploc"/"$line".xml
	echo "$line .......done"
done < data.dat
