function H=homdltps_dh(mh)


% INPUT:
%  mh = [m1x m1y m1w m2x m2y m2w], n*6-matrix for matched points,
%      mh1 points in the plane Z=1, mh2 points on the unit sphere 
% OUTPUT:
%  H = homography, 3*3-matrix

n=size(mh,1);
%Normalize mh1 and mh2 respectively
%m1=mh(:,1:2);
% center_m1 = mean(m1);
% traslated_m1 = m1 - center_m1;
% mean2Center_m1 = mean(sqrt(sum(traslated_m1.^2,2)));
% scale_m1 = sqrt(2)/mean2Center_m1;
% T1 = diag([scale_m1,scale_m1,1]);
% T1(1:2,3)=-scale_m1*center_m1(1:2)';
% m1=mh(:,1:3);
% m1 = (T1*m1')';

m1=mh(:,1:3); %cartesian
m1norm=sqrt(sum(m1.^2,2));
m1=m1./(m1norm*ones(1,3));

m2=mh(:,4:6); %spherical
m2norm=sqrt(sum(m2.^2,2));
m2=m2./(m2norm*ones(1,3));

A=zeros(3*n,9);
%Solving for A*h = 0; 
for idx=1:n
  xL=[m1(idx,:)']; %cartesian
  xR=[m2(idx,:)']; %spherical
  A(3*idx-2:3*idx,:)=[0 0 0 -xR(3)*xL' xR(2)*xL';...
                      xR(3)*xL' 0 0 0 -xR(1)*xL';...
                      -xR(2)*xL' xR(1)*xL' 0 0 0];
end

[U,S,V]=svd(A);  
%Decomposition, A=U*S*V', the unit eigenvector corresponding to the smallest eigenvalue is the solution h
%After SVD decomposition, S is a diagonal matrix with positive diagonal
% elements and arranged in descending order along the diagonal, then h is the last column of V
h=V(:,size(V,2));  % 
H=zeros(3); H(:)=h; H=H';




