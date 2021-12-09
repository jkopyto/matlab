function [ x ]  = custom_vand(n)
  nodes = linspace(0, 1, n)
  x = vander(nodes);
endfunction
