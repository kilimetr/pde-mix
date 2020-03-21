clear all; close all; clc

global pars; pars=struct;

pars.cini = 0;
pars.ckonec = 1;
pars.Deff = 5*10^(-2);

r = linspace(0,1); [rr,rs] = size(r);
t = linspace(0,10); [tr,ts] = size(t);

m = 0;

sol = pdepe(m,@Fickfun,@icfun,@bcfun,r,t);

c = sol(:,:,1);

[nt,nr,nc] = size(sol);

figure(1)
for i=1:nt
    plot(r,c(i,:)); hold on; box on; grid on; drawnow; pause(0.001); title(num2str(i));
    xlabel('r'); ylabel('c');
end
    
figure(2);
surfc(c); box on; grid on; xlabel('t'), ylabel('r'); zlabel('c'); shading interp;


function [c,f,s] = Fickfun(r,t,c,dcdr)

global pars

Deff = pars.Deff;

c = 1;
f = Deff*dcdr;
s = 0;

end


function [pL,qL,pR,qR] = bcfun(rL,cL,rR,cR,t)

global pars

ckonec = pars.ckonec;

pL = cL - ckonec;
qL = 0;

pR = cR - ckonec;
qR = 0;

end

function [c0] = icfun(r)

global pars

cini = pars.cini;

c0 = 0;

end
