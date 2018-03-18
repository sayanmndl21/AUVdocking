function [ U ] = pidcontrol(X)
% X=[x y z psi theta phi u v w p q r]'
global et Dt eprev Xd ni np nd

ki = ni*ones(6,1);
kp = np*ones(6,1);
kd = nd*ones(6,1);

l1 = 0.4;
l2 = 0.4;
%Tau=zeros(6,1);
% u = 9x1 throttle setting
Tmax = 10;
Tvrt = 2;
Tmain = Tmax*ones(1,1);
T(1,1:8) = Tvrt.*ones(1,8);
Th = [Tmain T(1,1:8)]';
Thruster = diag(Th);
L = [1 0 0 0 0 0 0 0 0;...
    0 0 -1 0 1 0 -1 0 1;...
    0 -1 0 1 0 -1 0 1 0;...
    0 0 0 0 0 0 0 0 0;...
    0 -l1 0 l1 0 l2 0 -l2 0;...
    0 0 l1 0 -l1 0 -l2 0 l2];
Ta = L*Thruster;
ta = Ta';

e = Xd(1:6,1) - X(1:6,1); 
et = et + e;

U1 = ki.*et*Dt + kd.*(e-eprev)/Dt + kp.*e;

U = ta*U1

% u = 9x1 throttle setting

end
