clc
clear all
close all

FOV = 70;       %degrees
f = 3.6;        %millimeters
mu = 1/0.0057;  %px/mm
mv = mu;
u0 = 640/2;     %principal point in pixels
v0 = 480/2;
squareSize = 30;

% load('points2D.mat')
% N = length(pts1)/3;
% pts1 = reshape(pts1,[3,2,N]);
% for i=1:N
%     ms{i} = pts1(:,:,i);
%     xs{i} = [0 0;0 10.3;0 15.7];
% end

fprintf('------------ >>> CAMERA 1 <<< ------------\n')
fprintf('[INFO] Extract points from checkerboard\n')
[ms,xs]=extractCorners('C:\Users\dbnun\Desktop\myCameraCalibrator\python\camera1',squareSize);

fprintf('[INFO] Initialising parameters\n')
[p0,thetamax]=initialiseParameters(FOV,f,mu,mv,u0,v0);
Hs = computeHomography(p0,ms,xs,[]);

fprintf('[INFO] Estimate extrinsics\n')
[R,t]=initialiseexternalp_dh(Hs,eye(3),0);
projerrs_dh(ms,xs,p0,R,t,0);

fprintf('[INFO] Minimizing error\n')
[p,R,t]=minimiseprojerrs_dh(ms,xs,p0,R,t,'radial',0);
projerrs_dh(ms,xs,p,R,t,0);