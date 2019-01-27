s2 = gen_dataset(10,false);

a2 = centered_dataset_rep(s2);

[knn2,k2,e2] =knnc(a2,1);
knne = nist_eval("centered_dataset_rep",knn2)

pars2  = parzenc(a2,1);
parse = nist_eval("centered_dataset_rep",pars2)

nmc2 = nmc(a2);
nmce = nist_eval("centered_dataset_rep",nmc2)

ldc2 = ldc(a2);
ldce = nist_eval("centered_dataset_rep",ldc2)

qdc2 = qdc(a2);
qdce = nist_eval("centered_dataset_rep",qdc2)

fisher2 = fisherc(a2);
fishere = nist_eval("centered_dataset_rep",fisher2)

log2 = loglc(a2);
loge = nist_eval("centered_dataset_rep",log2)

tree2 = treec(a2);
treee = nist_eval("centered_dataset_rep",tree2)
    
nn2 = neurc(a2);
nne = nist_eval("centered_dataset_rep",nn2)