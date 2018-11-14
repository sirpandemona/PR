clear all
clc
a = prnist([0:9],[1:1:1000]);
a = curve_rep(a);
w =ldc(a);
nist_eval('curve_rep',w,10)