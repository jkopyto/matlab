function x = badanie(A)
  clc
  #disp("Badana macierz ="), disp(A);
  
  [Q, R] = qr(A);
  disp("\nWspolczynnik uwarunkowania macierzy = "), disp(cond(A));
  norma = norm(Q * Q' - eye(size(Q)));
  disp("\nNorma spektralna ="), disp(norma); # Jeżeli zero to macierz ortonormalna
  
  if(norma == 0)
    disp("\nKolumny macierzy są ortonormalne");
  else
    disp("\nKolumny macierzy nie są ortonormalne" );
  endif
  
  b = A(:,1);
  
  # Gauss
  time_gauss = clock();
  x_gauss = gauss(A, b);
  
  disp("\nCzas obliczen dla metody gaussa ="), disp(etime(clock(), time_gauss));
  #disp("\nx = "), disp(x_gauss);
  
  #QR
  time_qr = clock();
  [Q, R] = qr(A); 
  x_qr = R \ Q' * b;
  
  disp("\nCzas obliczen przy uzyciu rozkladu QR ="), disp(etime(clock(), time_qr));
  #disp("\nx = "), disp(x_qr);
  
  accurate_sol = A \ b;
  
  error_gauss = norm(accurate_sol - x_gauss, 2);
  error_qr = norm(accurate_sol - x_qr, 2);
  
  error_residual_gauss = norm(A * x_gauss - b, 2);
  error_residual_qr = norm(A * x_qr - b, 2);
  
  disp("\nBłąd dla metody gaussa"), disp(error_gauss);
  disp("\nBłąd dla rozkładu QR"), disp(error_qr);
  disp("\nBłąd reszt dla metody gaussa"), disp(error_residual_gauss);
  disp("\nBłąd reszt dla rozkładu QR"), disp(error_residual_qr);
  
 endfunction
