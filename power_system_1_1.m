clc;
clear all;
z=[1i,0.4i,0.2i,Inf;
    0.4i,0.8i,0.2i,Inf;
    0.2i,0.2i,Inf,0.8i;
    Inf,Inf,0.8i,Inf];
disp('Here Z Matrix')
z
for a=1:4
    for b=1:4
        y(a,b)=1/z(a,b);
    end
end
disp('Here Y Matrix')
y
for a=1:4
    for b=1:4
        if a==b
            s=0;
            for k=1:4
                s=s+y(a,k);
                Y(a,b)=s;
            end
        else
            Y(a,b)=-y(a,b);
        end
    end
end
disp('Here Y bus Matrix')
Y