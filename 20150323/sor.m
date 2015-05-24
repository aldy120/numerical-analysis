n=12;
e=ones(n,1);
n2=n/2;
a=spdiags([-e 3*e -e],-1:1,n,n);
C=spdiags([e/2],0,n,n);
C=fliplr(C);
a=a+C;
a(n2+1,n2)=-1;
a(n2,n2+1)=-1;
b=zeros(n,1);
b(1)=2.5;
b(n)=2.5;
b(2:n-1)=1.5;
b(n2:n2+1)=1;
%%
% Jacobi Method
tic
n=length(b);
d=diag(a);
r=a-diag(d);
x=zeros(n,1);
k=50;
for j=1:k
    x=(b-r*x)./d;
    err(j)=norm(a*x-b,inf);
end
plot(err);
toc
%%
%Gauss-Seidal method
tic
n=length(b);
d=diag(a);
r=a-diag(d);
x=zeros(n,1);
k=50;
for j=1:k
    for i=1:n
        x(i)=(b(i)-r(i,:)*x)/d(i);
    end
    err(j)=norm(a*x-b,inf);
end
plot(err);
toc
%%
%Gauss-Seidal method(fast)
tic
n=length(b);
d=diag(a);
r=a-diag(d);
x=zeros(n,1);
k=50;
for j=1:k
    x(1)=(b(1)+x(2)-1/2*x(n))/3;
    for i=2:n2-1
        x(i)=(b(i)+x(i-1)+x(i+1)-1/2*x(n+1-i))/3;
    end
    x(n2)=(b(n2)+x(n2+1)+x(n2-1))/3;
    x(n2+1)=(b(n2+1)+x(n2+1+1)+x(n2+1-1))/3;
    for i=n2+2:n-1
        x(i)=(b(i)+x(i-1)+x(i+1)-1/2*x(n+1-i))/3;
    end
    x(n)=(b(n)+x(n-1)-1/2*x(1))/3;
    err(j)=norm(a*x-b,inf);
end
plot(err);
toc
%%
%SOR method(fast)
tic
n=length(b);
d=diag(a);
r=a-diag(d);
x=zeros(n,1);
k=50;
w=1.1;
for j=1:k
    x(1)=w*(b(1)+x(2)-1/2*x(n))/3+(1-w)*x(1);
    for i=2:n2-1
        x(i)=w*(b(i)+x(i-1)+x(i+1)-1/2*x(n+1-i))/3+(1-w)*x(i);
    end
    x(n2)=w*(b(n2)+x(n2+1)+x(n2-1))+(1-w)*x(n2);
    x(n2+1)=w*(b(n2+1)+x(n2+1+1)+x(n2+1-1))/3+(1-w)*x(n2+1);
    for i=n2+2:n-1
        x(i)=w*(b(i)+x(i-1)+x(i+1)-1/2*x(n+1-i))/3+(1-w)*x(i);
    end
    x(n)=w*(b(n)+x(n-1)-1/2*x(1))/3+(1-w)*x(n);
    err(j)=norm(a*x-b,inf);
end
plot(err);
toc