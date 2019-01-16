%clear all
%clc
prtime(300);
a = prnist([0:9],[1:100:1000]);
a = my_rep(a);
w =adaboostc(a,svc(proxm('p',2)));
e = nist_eval('my_rep',w,100)