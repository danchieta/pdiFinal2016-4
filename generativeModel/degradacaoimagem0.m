close all
clear
clc

%carrega dados da imagem original
load dadosimagem

dkpb = imageDegrade(kpb,...
    1,... %fator de degradacao
    2,... %gamma da PSF
    0,... %angulo de rotacao em radianos
    [0 ; 0],... %deslocamento em x e y
    0); %desvio padra do ruido

imshow(dkpb);