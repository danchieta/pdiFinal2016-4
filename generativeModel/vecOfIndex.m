function [ vec ] = vecOfSub( m, n )
%vecOfIndex Creates a horizontal array of the subscripts of a matrix.
%   m - number of rows
%   n - number of columns

N = m*n;
vec = zeros(2,N);

[vec(1,:) ; vec(2,:)] = ind2sub([m n],[1:N]);

return;
end

function [ vec ] = vecOfSub(s)
%vecOfIndex Creates a horizontal array of the subscripts of a matrix.
%   s - size of matrix

m = s(1);
n = s(2);

vec = vecOfSub(m , n);

return;
end
