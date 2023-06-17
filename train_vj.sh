#!/bin/bash
opencv_traincascade -data ./result/ -vec data/test.vec -bg vj_train_m_False_matchdrill/neg/bg.txt -numPos 300 -numNeg 280 -w 28 -h 28 -precalcValBufSize 1024 -precalcIdxBufSize 1024 -numStages 6 -acceptanceRatioBreakValue 1.0e-5
