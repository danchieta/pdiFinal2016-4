close all
clear
clc

load dadosimagensest

y = single(reshape(dkpb,numel(dkpb),1)); %imagem LR vetorizada e convertida
                                         %e convertida para single

%parametros para estimacao da matrix da PSF
gamma = 2
s = [0; 0];
theta = 0;
beta = 10;


Z_x = genCovMatrix(size(dkpb),15,10); %matriz de covariancia da imagem
                                     %da distribuicao a priori da imagem 
                                     %original (HR)

W = getPSFMatrix(size(kpb), size(dkpb), 2, s, theta);

% matriz de covariancia e vetor media da distribuicao posterior
% p(x|{y,s,theta},gamma)
Sigma = inv(inv(Z_x) + beta*(W'*W));
mu = beta*Sigma*(W*y);




