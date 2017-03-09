close all
clear
clc

load dadosimagem

dkpb = imageDegrade(kpb,...
    1,... %fator de degradacao
    2,... %gamma da PSF
    0,... %angulo de rotacao
    [0 ; 0],... %deslocamento em x e y
    0); %desvio padrão do ruído

imshow(dkpb);