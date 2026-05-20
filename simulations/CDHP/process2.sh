#!/bin/bash
indexes=({0..0})
for dir in md*/; do
	n=${dir#md}
	n=${n%/}
	if [[ " ${indexes[@]} " =~ " ${n} " ]]; then
		cd "md${n}"
		rm test0.xtc
		rm "${n}".xtc
		printf "3\n1\n" | gmx trjconv -f "md${n}.xtc" -s "md${n}.tpr" -pbc mol -center -o test0.xtc
		printf "4\n1\n" | gmx trjconv -f "test0.xtc" -s "../md0/top.pdb" -fit rot+trans -o "${n}".xtc
		cd ..
	fi
done
