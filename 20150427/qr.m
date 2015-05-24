% a0=[-3,3,5;1,-5,-5;6,6,4];
a0=[-2,1,0,0;1,-3,-1,0;0,-1,1,1;0,0,1,3]
rng(1)
[m,n]=size(a0);
x0=rand(n,1);
[ve,va]=eig(a0)
%%
% power method
a=a0;
x=x0;
for j=1:20;
    u=x/norm(x);
    x=a*u;
    lam=u'*x;
    L(j)=lam;
end
L
u=x/norm(x)

%% Inverse power iteration
x=x0;
a=a0;
s=0;
%s=3.5
as=a-s*eye(size(a));
for j=1:20
    u=x/norm(x);
    x=as\u;
    lam=u'*x;
    L1(j)=1/lam+s;
end
L1
u=x/norm(x)
%% Rayleigh quotion iteration
x=x0;
a=a0;
for j=1:20
    u=x/norm(x);
    s=u'*a*u;
    x=(a-s*eye(size(a)))\u;
    L2(j)=s;
end
u=x/norm(x);
lam=u'*a*u
L2
%% QR method
a=a0;
[m,n]=size(a);
Q=eye(m);
R=a;
Qbar=Q;
for j=1:20
    [Q,R]=qr(R*Q);
    Qbar=Qbar*Q;
    L3(:,j)=diag(R*Q);
end
L3
Qbar
%% NSI
Q=eye(m);
for j=1:20
    [Q,R]=qr(a*Q);
    lam=diag(Q'*a*Q);
    L4(:,j)=lam;
end
L4