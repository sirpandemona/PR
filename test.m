a = prnist([0:9],[1:40:1000]);
a = my_rep(a);
w =ldc(a);
nist_eval('my_rep',w,10)