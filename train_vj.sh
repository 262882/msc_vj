#!/bin/bash

stages=5
working_dir="temp"
mkdir $working_dir

opencv_traincascade \
-data ./$working_dir/ \
-vec data/test.vec \
-bg vj_train_m_False_matchdrill/neg/bg.txt \
-numPos 140 \
-numNeg 280 \
-w 28 \
-h 28 \
-precalcValBufSize 1024 \
-precalcIdxBufSize 1024 \
-numStages $stages \
-acceptanceRatioBreakValue 1.0e-5 \
-mode ALL \
-weightTrimRate 0.95 \
-maxDepth 1 \
-minHitRate 0.999 \
-maxFalseAlarmRate 0.1 \

mv $working_dir/cascade.xml result/ballcascade_$stages.xml
rm -rf $working_dir

# The precision of your cascade is shown by acceptanceRatio on the last stage it should be around this value 0.000412662 or less.
# Negatives = 2x positives
# https://docs.opencv.org/4.x/dc/d88/tutorial_traincascade.html
# https://answers.opencv.org/question/64431/number-of-stages-or-maxfalsealarmrate/
