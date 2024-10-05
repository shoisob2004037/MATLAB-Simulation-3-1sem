clc
clear all
n=3;       %total number of buses
Y=  [20.0000-50.0000i -10.0000+20.0000i -10.0000+30.0000i
 -10.0000+20.0000i  26.0000-52.0000i -16.0000+32.0000i
 -10.0000+30.0000i -16.0000+32.0000i  26.0000-62.0000i]
V=[1.05+0j 1+0j 1+0j];
pqsch=[-2.566; -1.386; -1.102; -0.452];
Ym=abs(Y); t = angle(Y);
Vm=abs(V); d=angle(V);
%dpq=1;
e=0;
c=0;
while ~e
    c=c+1;
    disp(['Iteration:' num2str(c)])
    H=zeros(n-1,n-1);
    L=zeros(n-1,n-1);
    M=zeros(n-1,n-1);
    N=zeros(n-1,n-1);
%-------P--------
P=zeros(n-1,1);
for z=2:n
    for k=1:n
        P(z-1,1)=P(z-1,1)+Vm(z)*Vm(k)*Ym(z,k)*cos(t(z,k)-d(z)+d(k));
    end
end
%-------Q--------
Q=zeros(n-1,1);
for z=2:n
    for k=1:n
        Q(z-1,1)=Q(z-1,1)-Vm(z)*Vm(k)*Ym(z,k)*sin(t(z,k)-d(z)+d(k));
    end
end
pq=[P; Q;];
dpq=pqsch-pq
%----------off diagonal elements of H,L,M,N----------
for z=2:n
    for k=2:n
        if z~=k
            H(z-1,k-1)=-Vm(z)*Vm(k)*Ym(z,k)*sin(t(z,k)-d(z)+d(k));
            L(z-1,k-1)=Vm(z)*Ym(z,k)*cos(t(z,k)-d(z)+d(k));
            M(z-1,k-1)=-Vm(z)*Vm(k)*Ym(z,k)*cos(t(z,k)-d(z)+d(k));
            N(z-1,k-1)=-Vm(z)*Ym(z,k)*sin(t(z,k)-d(z)+d(k));
        end
    end
end
%-----------------diagonal elements of H,L,M,N----------
for z=2:n
    for k=1:n
        if z~=k
           H(z-1,z-1)=H(z-1,z-1)+Vm(z)*Vm(k)*Ym(z,k)*sin(t(z,k)-d(z)+d(k));
           L(z-1,z-1)=L(z-1,z-1)+Vm(k)*Ym(z,k)*cos(t(z,k)-d(z)+d(k));
           M(z-1,z-1)=M(z-1,z-1)+Vm(z)*Vm(k)*Ym(z,k)*cos(t(z,k)-d(z)+d(k));
           N(z-1,z-1)=N(z-1,z-1)-Vm(k)*Ym(z,k)*sin(t(z,k)-d(z)+d(k));
        end
    end
    L(z-1,z-1)=L(z-1,z-1)+2*Vm(z)*Ym(z,z)*cos(t(z,z));
    N(z-1,z-1)=N(z-1,z-1)-2*Vm(z)*Ym(z,z)*sin(t(z,z));
end
J=[H,L;M,N;]
ddv=J\dpq
for z=1:n-1
    d(z+1)=d(z+1)+ddv(z,1);
end
for z=1:n-1
    Vm(z+1)=Vm(z+1)+ddv(n-1+z,1);
end
e=1;
for a=1:2*n-2
    e=e & abs(dpq(a,1))<=.00001;
end
Vm
d
end
disp('Bus Voltages are :')
for z=1:n
disp(['V' ,num2str(z), '  ' num2str(Vm(z)) '<' num2str(180/pi*d(z))])
end
