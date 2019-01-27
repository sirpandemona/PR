prtime(600);
a = gen_dataset(10,false);
a = my_rep(a);
w =adaboostc(a,svc);
e = nist_eval('my_rep',w,100)