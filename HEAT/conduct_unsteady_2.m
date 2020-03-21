close all; clear all; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% UNSTEADY HEAT CONDUCTION THROUGH THE WALL - heating on left side %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global pars; pars = struct;

pars.lambda   = 385;
pars.rho      = 10;
pars.cp       = 358.49;
pars.Tpocatek = 320;

x = (0:0.01:1);
t = (0:0.05:7);
m = 0;

sol = pdepe(m,@pdefun,@icfun,@bcfun,x,t);

T = sol(:,:,1);

[nt,nx,nT] = size(sol);

figure(1)
for i=1:nt
    plot(x,T(i,:)); hold on; box on; grid on; drawnow; pause(0.001); title(num2str(i));
    xlabel('x'); ylabel('T');
end

figure(2)
surf(x,t,sol); xlabel('Wall Thickness [m]'); ylabel('Time [s]'); zlabel('Temperature [K]'); shading interp;
colorbar;

function [c,f,s] = pdefun(x,t,T,dTdx)

global pars;

lambda = pars.lambda;
rho    = pars.rho;
cp     = pars.cp;

a = lambda / (rho*cp); % heat difusivity

c = 1;
f = a * dTdx;
s = 0;

end


function [T0] = icfun(x)

global pars;

Tpocatek = pars.Tpocatek;

T0 = Tpocatek;

end

function [pL,qL,pR,qR] = bcfun(xL,TL,xR,TR,t)

global pars;

Tpocatek = pars.Tpocatek;

pL = 370 - TL;
qL = 0;

pR = TR - Tpocatek;
qR = 1;

end

