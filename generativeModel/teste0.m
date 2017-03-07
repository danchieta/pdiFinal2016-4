%Este código é uma aplicação do modelo de observação
%descrito no artigo Bayesian Image Super-Resolution de Michael Tipping
% David Campos Anchieta 2017

d = [208 300]; %dimencoes da imagem original
dd = d/4; %dimencoes imagem reduzida

N = prod(d);
M = prod(dd);

vec_vj = single(vecOfSub(dd));

theta = 0; %angulo de rotacao
R = [cos(theta) sin(theta)
    -sin(theta) cos(theta)]; %vetor de rotacao

v = single(repmat([208 ; 300],1,M)); %centro da imagem
s = single(repmat([104 ; 55],1,M)); %deslocamento

gamma = 4; %valor arbitrario para a psf

vec_u = R*(vec_vj-v)+v+s; %parametro da psf

clear vec_vj v s R theta;

vec_vi = single(vecOfSub(d));

k = subtraiArray(vec_vi,vec_u); 

clear vec_vi vec_u

W = exp(-(k.^2)/gamma^2);

clear k
W = W./repmat(sum(W,2),1,N); %point spread function