#!/bin/bash
var1="$(pwd)/results/slurm-%j.err"
var2="$(pwd)/results/slurm-%j.out"
var3="stampede"

for numStages in 1 2 3 4 5 6 7 8 9 10 11 12
do
    for FA in 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5
    do
        sbatch --error=$var1 --output=$var2 --partition=$var3 train_vj_cluster.sh $numStages $FA &
    done
done
