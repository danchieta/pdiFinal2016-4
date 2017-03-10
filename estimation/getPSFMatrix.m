function [ W ] = getPSFMatrix( d, dd, gamma, s, theta )
%getPSFMatrix Obtem matriz de transformação de espalhamento de ponto a
%partir de parametros
%   Detailed explanation goes here

N = prod(d);
M = prod(dd);

vec_vj = vecOfSub(dd);

R = [cos(theta) sin(theta)
    -sin(theta) cos(theta)]; %vetor de rotacao

v = repmat(round(d/2)',1,M); %centro da imagem
s = repmat(s,1,M); %deslocamento

vec_u = R*(vec_vj-v)+v+s; %parametro da psf

clear vec_vj v s R theta;

vec_vi = vecOfSub(d);

k = subtraiArray(vec_vi,vec_u); 

clear vec_vi vec_u

W = exp(-(k.^2)/gamma^2);

clear k
W = W./repmat(sum(W,2),1,N); %point spread function

end

