close all
clear
clc

% recebe dados da imagem degradada e da original
load dadosimagensest

y = double(reshape(dkpb,numel(dkpb),1)); %imagem LR vetorizada e convertida
                                         %e convertida para single

%parametros para estimacao da matrix da PSF
gamma = .5;
s = [0; 0];
theta = 0;
beta = 1;


Z_x = genCovMatrix(size(dkpb),1,1); %matriz de covariancia da imagem
                                     %da distribuicao a priori da imagem 
                                     %original (HR)
D = det(Z_x)

W = getPSFMatrix(size(kpb), size(dkpb), gamma, s, theta);

% matriz de covariancia e vetor media da distribuicao posterior
% p(x|{y,s,theta},gamma)
Sigma_inv = inv(Z_x) + beta*(W'*W);
mu = (beta*inv(Sigma_inv))*(W*y);

%funcao de verossimilhanca para os parametros da PSF
log_L = -(beta*norm(y-W*mu)^2+(mu'/Z_x)*mu + log(D))/2;


