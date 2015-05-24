% n=6;
n=10;
for ii=1:n
    for jj=1:n
        H(ii,jj)=1/(ii+jj-1);% Hilbert matrix
    end
end
x=ones(n,1);
b=H*x;
format long;
xa=H\b;
norm(x-xa,inf); % infinte norm

cond(H,inf)
norm(H,inf)*norm(inv(H),inf)