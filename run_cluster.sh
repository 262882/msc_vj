#!/bin/bash
var1="$(pwd)/results/slurm-%j.err"
var2="$(pwd)/results/slurm-%j.out"
var3="stampede"
sbatch --error=$var1 --output=$var2 --partition=$var3 train_vj_cluster.sh
