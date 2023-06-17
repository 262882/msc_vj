#!/bin/bash
name=vj_train_m_False_matchdrill_True
opencv_createsamples -info ./$name/pos/info.dat -w 28 -h 28 -vec data/$name.vec
