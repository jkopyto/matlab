function [ x ] = gauss(A,b)
  s = length(A); % liczba elementów w wierszu
  for k = 1:(s-1) % iteruję od 1 do "liczby elementów"
    for i = s: -1:k+1 % iteruję od "liczby elementów" do k+1
      % np. (5,1), (4,1)...(2,1), (5,2),(4,2),(3,2),(5,3),(4,3),(5,4).
      % A(i,k) są elementami pod przekątną macierzy A
      m = A(i,k)/A(k,k); %wyliczam współczynnik
      A(i,:) = A(i,:) - m*A(k,:); % Od i-tych wierszy odejmuję k-te wiersze przemnożone przez współczynnik
      b(i) = b(i) - m*b(k); % Dokonuję takiej samej operacji na macierzy b
    end
  end
  
  %Na podstawie wyliczonej macierzy trójkątnej obliczam wynik
  
  x = zeros(s,1); %tworzę wektor pomocniczy
  x(s) = b(s)/A(s,s); % dzielę ostatni element wektora b przez element macierzy A z ostatniego wiersza i ostatniej kolumny
  % Dzięki temu uzyskuję wynik dla ostatniego wiersza macierzy
  
  %Wyliczam pozostałe wyniki
  for i = s-1: -1: 1
    sum = 0;
    for k = s:-1:i+1
      % Elementy A(i,k) są elementami nad przekątną macierzy
      % Pomijam ostatni wiersz macierzy (wynik został już obliczony).
      
      sum = sum + A(i,k)*x(k); %Sumuję wyniki mnożenia elementów i,k pomnożonych przez odpowiadający element wektora x
    end
    x(i) = (b(i)- sum)/A(i,i); %Wyliczam wynik dla danego wiersza
  end
endfunction
