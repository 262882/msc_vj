#!/bin/bash
out_dir=$1
opencv_visualisation --image=data/ball32.jpeg --model=$1 --data=${out_dir%.*}_
