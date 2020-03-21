function [c,f,s] = pdefun(z,t,cA,dcAdx,parsp)
% PDE FUNCTION

V    = 10;
Vdot = 2;
k    = 0.01;
A    = pi*0.05^2;

c = V;
f = - Vdot*dcAdx;
s = - 1*k*cA*A*cA(1);

end
