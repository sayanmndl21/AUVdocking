function [ Tau ] = Actuator_ModelROV( U )
%Actuator_Model Thruster/Actuator Models
l1 = 0.1202;
l11 = 0.1838;
l2 = 0.6660;
%Tau=zeros(6,1);
% u = 9x1 throttle setting
T = 0.7071.*ones(1,5);
Thruster = diag(T);
L = [1 1 -1 -1 0;...
    1 -1 1 -1 0;...
    0 0 0 0 1.4142;...
    0 0 0 0 0;...
    l1 l1 -l1 -l1 l11;...
    l2 -l2 -l2 l2 0];
Tau = L*Thruster*U;

end
