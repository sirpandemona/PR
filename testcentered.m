s2 = gen_dataset(10,false);

a2 = centered_dataset(s2,[24 4]);

pca2 = pca(a2);

a2 = a2*pca2;

[knn2,k2,e2] =knnc(a2,1);
knne = evalgeneric(pca2*knn2,10,@centered_dataset,[24 4])

pars2  = parzenc(a2,1);
parse = evalgeneric(pca2*pars2,10,@centered_dataset,[24 4])

nmc2 = nmc(a2);
nmce = evalgeneric(pca2*nmc2,10,@centered_dataset,[24 4])

ldc2 = ldc(a2);
ldce = evalgeneric(pca2*ldc2,10,@centered_dataset,[24 4])

qdc2 = qdc(a2);
qdce = evalgeneric(pca2*qdc2,10,@centered_dataset,[24 4])

fisher2 = fisherc(a2);
fishere = evalgeneric(pca2*fisher2,10,@centered_dataset,[24 4])
% 
% log1 = loglc(a1);
% log2 = loglc(a2);
% loge = evalc(pca1*log1,pca2*log2)
% 
% tree1 = treec(a1);
% tree2 = treec(a2);
% treee = evalc(pca1*tree1,pca2*tree2)
    
% nn1 = neurc(a1);
% nn2 = neurc(a2);
% nne = eval(pca1*nn1,pca2*nn2)