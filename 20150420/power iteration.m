clear;
A=[1,3;2,2];
%x=[-5;5];
x=[4;-100];
for ii=1:10
    u=x/norm(x);
    x=A*u;
    lambda=u'*A*u;
end
u
lambda
