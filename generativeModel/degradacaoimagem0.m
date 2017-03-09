close all
clear
clc

load dadosimagem

dkpb = imageDegrade(kpb, .5, 2, 0, [35 ; 50], 0);

imshow(dkpb);