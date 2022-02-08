function d=homangleerr_dh(H,x,xp)

M=size(x,1);

xnorms=(sqrt(sum(x.^2,2)));
%zeroid=find(xnorms==0);
%xnorms(zeroid)=1;

xn=x./(xnorms*ones(1,3));

xs=(H*xp')';

xsnorms=(sqrt(sum(xs.^2,2)));
%zeroid=find(xsnorms==0);
%xsnorms(zeroid)=1;

xs=xs./(xsnorms*ones(1,3));

% scatter(xs(:,1),xs(:,2));
% hold on;
% scatter(xn(:,1),xn(:,2));
% legend('spherical coord from the 3d',...
%     'spherical coord from the image');
% hold off

for i=1:M
  d(i)=sin(acos(xn(i,:)*(xs(i,:))'));
end

d=d(:);
