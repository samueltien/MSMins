#!/bin/bash
export OMP_NUM_THREADS=10
export GMX_GPU_DD_COMMS=true
export GMX_GPU_PME_PP_COMMS=true
export GMX_FORCE_UPDATE_DEFAULT_GPU=true

FClist=(800 600 400 200 150 100 50)
for i in {0..6}; do
	echo 1 | gmx genrestr -f em/em.gro -o posre.itp -fc "${FClist[i]}" "${FClist[i]}" "${FClist[i]}"
	gmx grompp -f mdp/npt.mdp -c npt/npt"$((i+1))".gro -r npt/npt"$((i+1))" -p topol.top -t npt/npt"$((i+1))".cpt -o npt/npt"$((i+2))".tpr
	cd npt
	gmx mdrun -v -deffnm npt"$((i+2))" -nb gpu -bonded gpu -pme gpu -npme 1 -pin on -ntmpi 2 -ntomp 10
	cd ..
done
