function [ x ] = custom_matrix(k)
  B = rand(10, 10);
  [Q, R] = qr(B);
  C = triu(rand(10, 10));
  x = Q * C ^ k
endfunction