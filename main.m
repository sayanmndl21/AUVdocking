% Initialize variables

clear
close all
addpath('auv')
addpath('rov')
global Xd eprev ni np nd
eprev = zeros(6,1);
Tfinal=2; % Units are seconds
Tspan=0:0.01:Tfinal;
ni = 0;
np = 50;
nd = 0.5;
X0 = [0,0,0,0,0,0,0,0,0,0,0,0]';
Xd = [1 1 1 0 0 0 0 0 0 0 0 0]';
[t,X]=ode45(@DModelAUV,Tspan,X0);
n = length(X);
figure(1)
scatter3(X(:,1),X(:,2),X(:,3),'k');
hold on
scatter3(X(1,1),X(1,2),X(1,3),'*b');
scatter3(X(n,1),X(n,2),X(n,3),'*r');
for i = 1:length(Xd)
    figure(i+1)
   plot(t,X(:,i))
   
end