function [pL,qL,pR,qR] = bcfun(xL,uL,xR,uR,t)
% BOUNDARY CONDITION FUNCTION

pL = uL;
qL = 0;

pR = pi*exp(-t);
qR = 1;

end
