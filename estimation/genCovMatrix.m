function [ Z ] = genCovMatrix( s, A, r )
%genCovMatrix Obtem uma matriz de covariancia para uma distribuicao a
%priori de uma imagem de acordo com o descrito na equacao (1) de "Bayesian
%Image Super-resolution" de Michael Tipping
%   s = dimencoes da imagem em vetor linha
%   A = 'forca' da distribuicao a priori
%   r = escala de comprimento da correlacao

v = vecOfSub(s);
Z = subtraiArray(v,v);
Z = A*exp(-Z.^2/(r^2));

end