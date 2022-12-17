%Q2

dcm1=angle2dcm(30,60,90);
dcm2=angle2dcm(15,25,35);
dcm3=angle2dcm(32,23,75);

q_1b=dcm2quatm(dcm1)
q_1m=dcm2quat(dcm1)
q_2b=dcm2quatm(dcm2)
q_2m=dcm2quat(dcm2)
q_3b=dcm2quatm(dcm3)
q_3m=dcm2quat(dcm3)

function q = dcm2quatm (A)
q(4)=0.5*sqrt(1+trace(A));
q(1)=0.25/q(4)*(A(2,3)-A(3,2));
q(2)=0.25/q(4)*(A(3,1)-A(1,3));
q(3)=0.25/q(4)*(A(1,2)-A(2,1));
end



