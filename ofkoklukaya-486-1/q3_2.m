clc
clear
A = eye(3,3);
t=zeros(1,25000);
load hw1_data.mat;
q= zeros(4,25000);
q2= zeros(4,25000);
determinants = zeros(25000,1);

for a=1:25000
    crossW_act=[0,-W_act(3,a),W_act(2,a);W_act(3,a),0,-W_act(1,a);-W_act(2,a),W_act(1,a),0];
    Adot = -crossW_act * A;
    A=A+Adot*1;
    %A=A/sqrt(det(A));
    %determinants(a) = sqrt(det(A));
    q_a=dcm2quatm(A);
    q(:,a)=q_a/sqrt(q_a(1)^2+q_a(2)^2+q_a(3)^2);
    q2(:,a)=dcm2quat(A);
    t(a)=a;
end
hold on
figure(1);hold on; plot (t,q(1,:));plot (t,q(2,:)); plot (t,q(3,:));

%%
function q = dcm2quatm (A)
    q(4)=0.5*sqrt(1+trace(A));
    q(1)=0.25/q(4)*(A(2,3)-A(3,2));
    q(2)=0.25/q(4)*(A(3,1)-A(1,3));
    q(3)=0.25/q(4)*(A(1,2)-A(2,1));
end
%%
