df = gen_dataset(10,false);
ds = centered_dataset_rep(df);
[knn1,k1,e1] =knnc(ds,1);
w = knn1;
e = nist_eval(centered_dataset_rep,w,10)