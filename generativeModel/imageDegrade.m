function [ R ] = imageDegrade( img , num , f, gamma)
%Esta função é uma aplicação do modelo de observação
%descrito no artigo Bayesian Image Super-Resolution de Michael Tipping
%   img - imagem a ser degradada (uint8)
%   N - numero de imagem na saída
%   f - fator de sub-amostragem

d = size(img); %dimencoes da imagem original
dd = round(d/f); %dimencoes imagem reduzida

img = single(reshape(img,numel(img),1));

N = prod(d);
M = prod(dd);

vec_vj = vecOfSub(dd);

theta = 0; %angulo de rotacao
R = [cos(theta) sin(theta)
    -sin(theta) cos(theta)]; %vetor de rotacao

v = repmat([35 ; 50],1,M); %centro da imagem
s = repmat([0 ; 0],1,M); %deslocamento

vec_u = R*(vec_vj-v)+v+s; %parametro da psf

clear vec_vj v s R theta;

vec_vi = vecOfSub(d);
tic
k = subtraiArray(vec_vi,vec_u); 
tempo2 = toc

clear vec_vi vec_u

W = exp(-(k.^2)/gamma^2);

clear k
W = W./repmat(sum(W,2),1,N); %point spread function


R = uint8(reshape(W*img,dd));



end