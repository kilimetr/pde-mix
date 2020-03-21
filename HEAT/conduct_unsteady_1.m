close all; clear all; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% UNSTEADY HEAT CONDUCTION THROUGH THE WALL - book example %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = (0:0.05:20);
t = (0:0.05:5);
m =1;

sol = pdepe(m,@pdefun,@icfun,@bcfun,x,t);

T = sol(:,:,1);

[nt,nx,nT] = size(sol);

figure(1)
for i=1:nt
    plot(x,T(i,:)); hold on; box on; grid on; drawnow; pause(0.01); title(num2str(i));
    xlabel('x'); ylabel('T');
end

figure(2)
surf(x,t,sol); xlabel('Wall Thickness [m]'); ylabel('Time [s]'); zlabel('Temperature [K]'); shading interp;

function [c,f,s] = pdefun(x,t,T,dTdx)

c = pi^2;
f = dTdx;
s = 0;

end


function [T0] = icfun(x)

T0 = sin(pi*x);

end

function [pL,qL,pR,qR] = bcfun(xL,TL,xR,TR,t)

pL = TL;
qL = 0;

pR = pi * exp(-t);
qR = 1;

end

