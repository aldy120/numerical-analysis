A=[10,-12,-6;5,-5,-4;-1,0,3];

[m,n]=size(A);
Q=eye(n);
%%
for jj=1:100
    [Q,R]=qr(A*Q);
end
diag(Q'*A*Q)
%%
x=[1,0,0]';
for ii=1:100
    x=A*x;
    x=x/norm(x)
end
x
%%
la=1.1
% or 3.1 , 4.1
for ii=1:5
    x=(A-la*eye(3))\x;
    x=x/norm(x);
    la=x'*A*x;
end
x