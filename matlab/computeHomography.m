function Hs=computeHomography(p,ms,xs,thetamax)

% Copyright (C) 2004-2005 Juho Kannala
%
% This software is distributed under the GNU General Public
% Licence (version 2 or later); please refer to the file
% Licence.txt, included with the software, for details.

N=length(ms);  % total N views
err_homo = zeros(1,N);
Hs= cell(1,N);
for i=1:N
  x=generic2sphere_dh(ms{i},p,thetamax);
  xp=[xs{i} ones(size(xs{i},1),1)];
  if any(isnan(x),'all')
      fprintf(1,'Please remove image number %.4f\n',i);
      continue
  end
  % initial estimate for Hs from correspondences xp<->x by linear algorithm with data normalization
  H0=homdltps_dh([xp x]);  
  options_dh=optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt', 'Display','off');
  [H,~,res]=lsqnonlin(@homangleerr_dh,H0,[],[],options_dh,x,xp);
  err_homo(i)=mean(abs(res));
  Hs{i}=H;
end


fprintf('Average residual of lsqnonlin: %g\n',mean(err_homo))

