function [ Tau ] = Actuator_Model( U )
%Actuator_Model Thruster/Actuator Models
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
Tau = L*Thruster*U;

end
