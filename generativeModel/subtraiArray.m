function [ S ] = subtraiArray( A , B )
%subtraiArray Cria uma matriz cujos coponentes são subtrações de dois
%vetores n forma S(i,j) = ||A(i)-B(j)||
%   S(i,j) = A(i)-B(j);
S = sqrt(double(bsxfun(@minus,A(1,:),B(1,:)').^2+...
    bsxfun(@minus,A(2,:),B(2,:)').^2));
end

