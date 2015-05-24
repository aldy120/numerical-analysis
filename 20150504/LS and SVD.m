x=[2:0.2:4]';
A=[x.^0,x.^1,x.^2,x.^3,x.^4,x.^5,x.^6,x.^7];
y=A*ones(8,1);
c=(A'*A\A'*y)
%% Ac=y 
% Q is orthonormal
[Q,R]=qr(A,0);
b=Q'*y;
c=R(1:8,1:8)\b(1:8);
%%
% SVD is NOT unique!
% A*vi=si*vi => A(-vi)=si(-ui)
A=[0,1;0,-1];
[U,S,V]=svd(A);
%%
A=zeros(100,150);
A(20:30,40:60)=0.5;
A(80:90,20:30)=0.7;
A(50:70,120:130)=0.4;
A=A+randn(size(A))*0.1;
[U,S,V]=svd(A);
imshow(A)
figure(1)
for kk=1:6
    T=U(:,1:kk)*S(1:kk,1:kk)*V(:,1:kk)';
    imshow(T);
    title(kk);
    ginput(1)
end
%%
A=imread('C:\lena512.bmp');
imshow(A)
B=double(A)/256;
[U,S,V]=svds(B,20);
figure(1)
for kk=1:20
    T=U(:,1:kk)*S(1:kk,1:kk)*V(:,1:kk)';
    imshow(T);
    title(kk);
    ginput(1)
end
