clc
clear all
n=3;       %total number of buses
m=1;       %number of P-V buses
Y=[20-50j -10+20j -10+30j;
    -10+20j 26-52j -16+32j;
    -10+30j -16+32j 26-62j;];
V=[1.05+0j 1+0j 1.04+0j];
pqsch=[-4; 2; -2.5;];
Ym=abs(Y); t = angle(Y);
Vm=abs(V); d=angle(V);
%dpq=1
e=0;
c=0;
while ~e
    c=c+1;
    disp(['Iteration:' num2str(c)])
    H=zeros(n-1,n-1);
    L=zeros(n-1,n-1-m);
    M=zeros(n-1-m,n-1);
    N=zeros(n-1-m,n-1-m);
%-------P--------
P=zeros(n-1,1);
for r=2:n
    for k=1:n
        P(r-1,1)=P(r-1,1)+Vm(r)*Vm(k)*Ym(r,k)*cos(t(r,k)-d(r)+d(k));
    end
end
%-------Q--------
Q=zeros(n-1-m,1);
for r=2:n-m
    for k=1:n
        Q(r-1,1)=Q(r-1,1)-Vm(r)*Vm(k)*Ym(r,k)*sin(t(r,k)-d(r)+d(k));
    end
end
pq=[P; Q;];
dpq=pqsch-pq
%----------off diagonal elements of H,L,M,N----------
for r=2:n
    for k=2:n
        if r~=k
            H(r-1,k-1)=-Vm(r)*Vm(k)*Ym(r,k)*sin(t(r,k)-d(r)+d(k));
            if k<=(n-m)
            L(r-1,k-1)=Vm(r)*Ym(r,k)*cos(t(r,k)-d(r)+d(k));
            end
            if r<=(n-m)
            M(r-1,k-1)=-Vm(r)*Vm(k)*Ym(r,k)*cos(t(r,k)-d(r)+d(k));
            end
            if (k<=(n-m)) & (r<=(n-m))
            N(r-1,k-1)=-Vm(r)*Ym(r,k)*sin(t(r,k)-d(r)+d(k));
            end
        end
    end
end
%-----------------diagonal elements of H,L,M,N----------
for r=2:n
    for k=1:n
        if r~=k
           H(r-1,r-1)=H(r-1,r-1)+Vm(r)*Vm(k)*Ym(r,k)*sin(t(r,k)-d(r)+d(k));
           if r<=(n-m)
           L(r-1,r-1)=L(r-1,r-1)+Vm(k)*Ym(r,k)*cos(t(r,k)-d(r)+d(k));
           M(r-1,r-1)=M(r-1,r-1)+Vm(r)*Vm(k)*Ym(r,k)*cos(t(r,k)-d(r)+d(k));
           N(r-1,r-1)=N(r-1,r-1)-Vm(k)*Ym(r,k)*sin(t(r,k)-d(r)+d(k));
           end
        end
    end
    if r<=(n-m)
    L(r-1,r-1)=L(r-1,r-1)+2*Vm(r)*Ym(r,r)*cos(t(r,r));
    N(r-1,r-1)=N(r-1,r-1)-2*Vm(r)*Ym(r,r)*sin(t(r,r));
    end
end
J=[H,L;M,N;]
ddv=J\dpq
for r=1:n-1
    d(r+1)=d(r+1)+ddv(r,1);
end
for r=1:m
    Vm(r+1)=Vm(r+1)+ddv(n-1+r,1);
end
e=1;
for a=1:2*n-2-m
    e=e & abs(dpq(a,1))<=.00001;
end
Vm
d
end
disp('Bus Voltages are :')
for r=1:n
disp(['V' ,num2str(r), '  ' num2str(Vm(r)) '<' num2str(180/pi*d(r))])
end
