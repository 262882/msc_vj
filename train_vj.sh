#!/bin/bash
opencv_traincascade \
-data ./result/ \
-vec data/test.vec \
-bg vj_train_m_False_matchdrill/neg/bg.txt \
-numPos 140 \
-numNeg 280 \
-w 28 \
-h 28 \
-precalcValBufSize 1024 \
-precalcIdxBufSize 1024 \
-numStages 12 \
-acceptanceRatioBreakValue 1.0e-5 \
-mode ALL \
-weightTrimRate 0.95 \
-maxDepth 1 \
-minHitRate 0.999 \
-maxFalseAlarmRate 0.1 \

# The precision of your cascade is shown by acceptanceRatio on the last stage it should be around this value 0.000412662 or less.
# Negatives = 2x positives
# https://answers.opencv.org/question/64431/number-of-stages-or-maxfalsealarmrate/
