#!/bin/bash
for i in {0..0}; do
	rm -R md"$((i))"
	mkdir md"$((i))"
	gmx grompp -f mdp/md.mdp -p topol.top -c npt8.gro -o md"$((i))"/md"$((i))".tpr -maxwarn 99
done
