x=[-2.2,-2.8,-6.1,-3.9,0,1.1,-0.6,-1.1]';
[n,m]=size(x);
y=fft(x)/sqrt(n);

t=[1:100]/100;
a=real(y);
b=imag(y);
p=0;
for k=1:8
    p=p + a(k)*cos(2*pi*(k-1)*t) - b(k)*sin(2*pi*(k-1)*t);
end
p=p/sqrt(n);
plot(t0,p)
t1=[0:7]/8;
x1=x;
hold on
plot(t1,x1,'ro')