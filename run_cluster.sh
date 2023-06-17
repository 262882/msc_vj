#!/bin/bash
var1="$(pwd)/results/slurm-%j.err"
var2="$(pwd)/results/slurm-%j.out"
var3="stampede"

for numStages in 2 4 6 8 10 12
do
    for FA in 0.05 0.1 0.15 0.2 0.25
    do
        sbatch --error=$var1 --output=$var2 --partition=$var3 train_vj_cluster.sh $numStages $FA &
    done
done
