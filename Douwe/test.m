%clear all
%clc
a = prnist([0:9],[1:10:1000]);
a = my_rep(a);
b = a([1:100:1000],:);
w =adaboostc(a,knnc);
x = adaboostc(b,knnc);
e250 = nist_eval('my_rep',w,100)
e10 = nist_eval('my_rep',x,100)