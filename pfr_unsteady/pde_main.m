clear all; close all; clc;

V    = 10;
Vdot = 2; 
z    = linspace(0,5);
t    = linspace(0,1);
A    = pi*0.05^2;
k    = 0.01;
cA0  = 1;

sol = pdepe(1,@pdefun,@icfun,@bcfun,z,t);

cA = sol(:,:,1);

surf(z,t,cA);
