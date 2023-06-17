#!/bin/bash

stages=5
working_dir="temp"
data_name=vj_train_m_False_matchdrill_True
mkdir $working_dir

opencv_traincascade \
-data ./$working_dir/ \
-vec data/$data_name.vec \
-bg $data_name/neg/bg.txt \
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
-maxFalseAlarmRate 0.05 \

mv $working_dir/cascade.xml result/ballcascade_$stages.xml
rm -rf $working_dir

# minHitRate is the parameter that ensures us that our positive training data yields at least a decent detection output
# maxFalseAlarmRate is used to define how much features need to be added. Actually we want each weak classifier to have a very good hit rate on the positives, and then to allow them to remove negative windows, as fast as possible
# The precision of your cascade is shown by acceptanceRatio on the last stage it should be around this value 0.000412662 or less.
# Negatives = 2x positives
# maxFalseAlarmRate=0.9 This means that in each stage no more than 90% of the 40 negative samples (ie 36 samples) should lie inside the boundary of positives. When the algorithm manages to put outside that boundary at least 4 samples, it can go to the next stage.
# https://docs.opencv.org/4.x/dc/d88/tutorial_traincascade.html
# https://answers.opencv.org/question/64431/number-of-stages-or-maxfalsealarmrate/
