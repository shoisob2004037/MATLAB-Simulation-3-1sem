clc;
clear all;
close all;
ng1=[1]; dg1=[1 10]; sysg1=tf(ng1,dg1);

ng2=[1]; dg2=[1 1]; sysg2=tf(ng2,dg2);

ng3=[1 0 1]; dg3=[1 4 4]; sysg3=tf(ng3,dg3);

ng4=[1 1]; dg4=[1 6]; sysg4=tf(ng4,dg4);

nh1=[1 1]; dh1=[1 2]; sysh1=tf(nh1,dh1);

nh2=[2]; dh2=[1]; sysh2=tf(nh2,dh2);

nh3=[1]; dh3=[1]; sysh3=tf(nh3,dh3);

sys1=(sysh2/sysg4);
sys2=series(sysg3,sysg4);
sys3=feedback(sys2,sysh1,+1);
sys4=series(sysg2,sys3);
sys5=feedback(sys4,sys1);
sys6=series(sysg1,sys5);
TF=feedback(sys6,[1])



%excercise 1

TF1 = tf([1], [1 1]);  
TF2 = tf([1 2], [1]);  
TF3 = tf([1 0], [1 0 2]);  
TF4 = tf([1 0], [1]);  

TFNew1= feedback(TF3, TF4,-1);  

TFNew2 = feedback(TF1,TF2,+1);  

TF = series(TFNew1, TFNew2)

%excercise 2

ng1=[1]; dg1=[1 1]; G1=tf(ng1,dg1);

ng2=[1]; dg2=[1 2]; G2=tf(ng2,dg2);

ng3=[1 0]; dg3=[1 0 2]; G3=tf(ng3,dg3);

ng4=[1 0]; dg4=[1 1]; G4=tf(ng4,dg4);


nh1=[1.5]; dh1=[1]; H1=tf(nh1,dh1);

nh2=[1]; dh2=[1]; H2=tf(nh2,dh2);

p1=feedback(G1,H2,+1);
s_s1=(1/p1);
s1=series(p1,G3);
n_s1=(1/H1);
s2=series(H1,H2);
ns_s1=series(s_s1,n_s1);
s_s2=(1/s1);
ns_s2=series(s_s2,s2);
red1=feedback(s1,ns_s2,-1);
ns_s3=series(ns_s1,s2);
red2=feedback(red1,ns_s3,-1);

TF=feedback(red2,s2,-1)








