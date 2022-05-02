clc
clear all
close all

FOV = 62.2;       %degrees
f = 3.04;        %millimeters
mu = 1/0.00112;  %px/mm
mv = mu;
u0 = 960/2;     %principal point in pixels
v0 = 720/2;
squareSize = 30;
dirName = '~/Desktop/myCameraCalibrator/python/camera1/50cm';
extension = '*.jpg';

fprintf('[INFO] Extract points from checkerboard\n')
[ms,xs]=extractCorners(dirName,squareSize,extension);

fprintf('[INFO] Initialising parameters\n')
[p0,thetamax]=initialiseParameters(FOV,f,mu,mv,u0,v0);
Hs = computeHomography(p0,ms,xs,[]);

fprintf('[INFO] Estimate extrinsics\n')
[R,t]=initialiseexternalp_dh(Hs,eye(3),0);
projerrs_dh(ms,xs,p0,R,t,0);

fprintf('[INFO] Minimizing error\n')
[p,R,t]=minimiseprojerrs_dh(ms,xs,p0,R,t,'radial',0);
projerrs_dh(ms,xs,p,R,t,0);
