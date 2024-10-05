clc;
clear all;
close all;
a1 = input('Enter the number of rows: ');
b1 = input('Enter the number of coloumns: ');
for i=1:a1
    for j=1:b1
       fprintf('Enter the element p[%d,%d] =',i,j);
       p(i,j)=input("");
    end
end


display("Impedence Matrix")
p=reshape(p,[a1,b1])

for a = 1:a1
    for b= 1:b1
        y(a,b) = 1 / p(a,b);
    end
end
display("Admittance Matrix")
y
for a=1:a1
    for b=1:b1
        if a == b
            sum = 0;
            for i = 1:b1
                sum = sum + y(a,i);
                
            end
            Y(a,b) = sum;
        else
            Y(a,b) = -y(a,b);
        end
    end
end
display("Bus Admittance Matrix")
Y