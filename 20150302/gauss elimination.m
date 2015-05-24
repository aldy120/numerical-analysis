% LU factorization
% no exchange
clear;
%%
A=[1,2,-1;2,1,-2;-3,1,1];
b=[3,3,-6];
%%
dim=100;
A=randn(dim,dim);
b=randn(1,dim);
%%
tic;
[m,n]=size(A);
L=eye(m,m);
U=A;
for j=1:m-1
    for i=j+1:m
        mult=U(i,j)/U(j,j);
        L(i,j)=mult;
        for k=1:m
            U(i,k)=U(i,k)-mult*U(j,k);
        end
        b(i)=b(i)-mult*b(j);
    end
end
norm(L*U-A)
b

toc