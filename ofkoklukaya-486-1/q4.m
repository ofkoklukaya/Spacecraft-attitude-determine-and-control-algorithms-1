clc
clear
A = eye(3,3);
t=zeros(1,25000);
q= zeros(4,25000);
q1= zeros(4,25000);
load hw1_data.mat;
q(:,1)=dcm2quatm(A);
t(1)=0;
for a=1:25000
    crossW_act=[0,-W_act(3,a),W_act(2,a);W_act(3,a),0,-W_act(1,a);-W_act(2,a),W_act(1,a),0];
    W_d=W_act(:,a);
    na=[ -[0,-W_act(3,a),W_act(2,a);...
        W_act(3,a), 0, -W_act(1,a);...
        -W_act(2,a), W_act(1,a), 0], W_act(:,a); -transpose(W_act(:,a)), 0];
    qdot = 0.5*na*q(:,a);
    q(:,a+1)=q(:,a)+qdot*1;
    t(a)=a;
    q1(:,a)=q(:,a)/sqrt(q(1,a)^2+q(2,a)^2+q(3,a)^2);
end
hold on
figure(1);hold on; plot (t,q1(1,:));plot (t,q1(2,:)); plot (t,q1(3,:));

%%
function q = dcm2quatm (A)
    q(4)=0.5*sqrt(1+trace(A));
    q(1)=0.25/q(4)*(A(2,3)-A(3,2));
    q(2)=0.25/q(4)*(A(3,1)-A(1,3));
    q(3)=0.25/q(4)*(A(1,2)-A(2,1));
end
%%
