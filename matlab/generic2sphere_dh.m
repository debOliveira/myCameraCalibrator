function x=generic2sphere_dh(m,p,thetamax)

[theta,phi]=backproject_dh(m,p,thetamax);
x=[cos(phi).*sin(theta) sin(phi).*sin(theta) cos(theta)];

