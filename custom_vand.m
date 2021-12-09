function [ x ]  = custom_vand(n)
  nodes = linspace(1, 0, n)
  x = vander(nodes);
endfunction