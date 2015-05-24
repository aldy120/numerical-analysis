A=[0,1;1,3/2];
[U,D,V]=svd(A);
rng(1);
for jj=1:100000
    B=randn(2,1)*randn(1,2);
    dist(jj)=norm(A-B,'fro');
    if jj==18838
        B_best=B;
    end
end
hist(dist)
[s,t]=min(dist);
B_best
C=U(:,1)*D(1,1)*V(:,1)';