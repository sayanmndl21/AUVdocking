function [ X_dot ] = DModelAUV(t,X)
%DModelAUV Dynamic Model of a general Underwater Vehicle
% X=[x y z psi theta phi u v w p q r]'
global Dt et eprev
Dt = .01;
et=zeros(6,1);

eta=X(1:6);
nu=X(7:12);
M=[37.02  0     0     0    1.81   0  ;
     0  74.96   0   -1.81   0   -0.49;
     0    0   74.96   0   -0.49   0  ;
     0  -1.81   0    0.41   0     0  ;
    1.81  0    0.49   0    9.01   0  ;
     0  -0.49   0     0     0    9.01];
D1=zeros(6);
D2=diag([6.79, 133.42, 133.42, 0.001, 7.11, 7.11]);
W=0;
B=0;
r_g=[0 0 0]';
r_b=[0 0 0]';
J1=eul2rotm(eta(4:6)');
J2=[1 sin(eta(6))*tan(eta(5)) cos(eta(6))*tan(eta(5));
    0 cos(eta(6))             -sin(eta(6));
    0 sin(eta(6))/cos(eta(5)) cos(eta(6))/cos(eta(5))];
J=[J1 zeros(3); zeros(3) J2];
M1=M(1:3,:);
M2=M(4:6,:);
C=[zeros(3) -crossProductMatrix(M1*nu);
   -crossProductMatrix(M1*nu) -crossProductMatrix(M2*nu)];
D=D1*diag(abs(nu))+D2;
f_g=J1\[0 0 W]';
f_b=-J1\[0 0 B]';
g=-[f_g+f_b ; cross(r_g,f_g)+cross(r_b,f_b)];

U = pidcontrol(X);
tau=Actuator_Model(U);

eta_dot=J*nu;
nu_dot=M\(tau-C*nu-D*nu-g);
X_dot=[eta_dot;nu_dot];

end
