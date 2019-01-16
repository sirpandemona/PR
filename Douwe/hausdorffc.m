prtime(600);
a = prnist([0:9],[1:50:1000]);
b = hausdorff_rep(a);
w = knnc(b,1);
e = nist_eval('hausdorff_rep',w,20)