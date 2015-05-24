n=2;
A=[2,2;2,5];
b=[6,3]';
%%
clear;clc;
n=100000;
e=ones(n,1);
A=spdiags([-e 3*e -e],-1:1,n,n);
c=spdiags([e/2],0,n,n);
c=fliplr(c);
A=A+c;

n2=n/2;
A(n2+1,n2)=-1;
A(n2,n2+1)=-1;
b=zeros(n,1);
b(1)=2.5;
b(n)=2.5;
b(2:n-1)=1.5;
b(n2:n2+1)=1;
%%
%Conjugate Gradient
tic
x=zeros(n,1);
r=b;
d=b-A*x;
for ii=1:200
    alpha=(r'*r)/(d'*A*d);
    x=x+alpha*d;
    rnew=r-alpha*A*d;
    beta=(rnew'*rnew)/(r'*r);
    d=rnew+beta*d;
    
    
    error(ii)=norm(rnew);
    if norm(rnew)<1e-8
        break;
    end
    r=rnew;
end
hold on;
plot(error,'c');
toc;
% Jacobi Method
tic
n=length(b);
d=diag(A);
r=A-diag(d);
x=zeros(n,1);
k=200;
for j=1:k
    x=(b-r*x)./d;
    err(j)=norm(A*x-b);
    if err(j)<1e-8
        break;
    end
end
plot(err,'r');
toc