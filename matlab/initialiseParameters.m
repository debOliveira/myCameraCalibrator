function [p0,thetamax]=initialiseParameters(FOV,f,mu,mv,u0,v0)
% [pinit,thetamax]=initialiseinternalp(sys)
%
% INITIALISEINTERNALP initialises the internal camera parameters.
%
% See also CALIBCONFIG

% Copyright (C) 2004 Juho Kannala
%
% This software is distributed under the GNU General Public
% Licence (version 2 or later); please refer to the file
% Licence.txt, included with the software, for details.

thetamax=FOV/2*pi/180;
theta=0:0.1/180*pi:thetamax;
r=f*tan(theta);

[k,mres]=poly_fit2oddlsq(theta,r,3);
k1=k(1); k2=k(3);
fprintf('Average residual of fit2oddlsq: %g\n',mean(mres))

 p0=[k1 k2 f*mu f*mv u0 v0];
 fprintf('Initial parameters: [%g %g %g %g %g %g]\n',p0)