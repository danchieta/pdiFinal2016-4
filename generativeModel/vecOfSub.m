function [ vec ] = vecOfSub(s)
%vecOfIndex Creates a horizontal array of the subscripts of a matrix.
%   s - dimensions of the matrix

N = prod(s);
vec = zeros(2,N);

[vec(1,:), vec(2,:)] = ind2sub(s,1:N);

return;
end