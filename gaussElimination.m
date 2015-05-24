dim=3;
% A=[1,2,-1;2,1,-2;-3,1,1];
A=[2,1,5;4,4,-4;,1,3,1];
% A=[1,2,3;4,5,6;7,8,9];
b=[3,3,-6];
% A=randn(dim,dim);
% b=randn(1,dim);
[m,n]=size(A);
L=zeros(m,m);
P=eye(m,m);
U=A;
for j=1:m-1
    [maxj,maxjj]=max(abs(U([j+1,end],j)));
    maxjj=maxjj+j;
    maxjj
    U([j,maxjj],:)=U([maxjj,j],:);
    P([j,maxjj],:)=P([maxjj,j],:);
    L([j,maxjj],:)=L([maxjj,j],:);
    b([j,maxjj])=b([maxjj,j]);
    if U(j,j)==0
            continue;
    end
    for i=j+1:m
        
        mult=U(i,j)/U(j,j);
        L(i,j)=mult;
        for k=1:m
            U(i,k)=U(i,k)-mult*U(j,k);
        end
        b(i)=b(i)-mult*b(j);
    end
end
L=L+eye(dim);
[LL,UU]=lu(A);