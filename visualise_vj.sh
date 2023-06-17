#!/bin/bash
out_dir=$1
opencv_visualisation --image=data/edge28.png --model=$1 --data=${out_dir%.*}_
