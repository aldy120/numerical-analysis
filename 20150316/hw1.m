A=[3,-1,0,0,0,1/2;
    -1,3,-1,0,1/2,0;
    0,-1,3,-1,0,0;
    0,0,-1,3,-1,0;
    0,1/2,0,-1,3,-1;
    1/2,0,0,0,-1,3];
x=zeros(6,1);
b=[5/2,3/2,1,1,3/2,5/2]';
% A=D+L+U
D=zeros(6,6);
L=zeros(6,6);
U=zeros(6,6);
for ii=1:6
    D(ii,ii)=A(ii,ii);
    L(ii+1:end,ii)=A(ii+1:end,ii);
    U(ii,ii+1:end)=A(ii,ii+1:end);
end
% % Jacobi method
% for ii=1:6
%     for kk=1:6
%         x1(kk,1)=1/D(kk,kk)*(b(kk)-L(kk,:)*x-U(kk,:)*x);
%     end
%     x=x1;
% end
% % Gauss-Seidel
% for ii=1:6
%     for kk=1:6
%         x(kk,1)=1/D(kk,kk)*(b(kk)-L(kk,:)*x-U(kk,:)*x);
%     end
%     
% end

% SOR
x=zeros(6,1);
w=1.1;
for ii=1:6
    for kk=1:6
        x1(kk,1)=1/D(kk,kk)*(b(kk)-L(kk,:)*x-U(kk,:)*x);
        x(kk,1)=(1-w)*x(kk,1)+w*x1(kk,1);
        %x(kk,1)=x1(kk,1);
    end
    
end