function [Q] = uni_scalar(Delta,sgn,x)

Q = Delta .* sgn .* floor((abs(x)./Delta) + (1/2)); 



