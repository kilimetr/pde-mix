clear all; close all; clc;

x = linspace(0,5);
t = linspace(0,5);

sol = pdepe(0,@pdefun,@icfun,@bcfun,x,t);

u = sol(:,:,1);

surf(x,t,u); xlabel('Distance'); ylabel('Time'); zlabel('Wave');
