function [pL,qL,pR,qR] = bcfun(zL,dcAdz,zR,cAR,t)
% BOUNDARY FUNCTION

cA0 = 1;
D   = 1*10^(-5);

pL = -D*dcAdz;
qL = 0;

pR = cAR;
qR = 0;

end
