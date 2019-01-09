s1 = prnist([0:9],[1:1000]);
s2 = prnist([0:9],[1:10]);

a1 = my_rep(s1);
a2 = my_rep(s2);

pca1 = pca(a1);
pca2 = pca(a2);
a1 = a1*pca1;
a2 = a2*pca2;
%w1 = fisherm(a1);
%w2 = fisherm(a2);
%a1 = a1*w1;
%a2 = a2*w2;


[knn1,k1,e1] =knnc(a1,1);
[knn2,k2,e2] =knnc(a2,1);
knne = eval(pca1*knn1,pca2*knn2)

    pars1  = parzenc(a1,1);
    pars2  = parzenc(a2,1);
    parse = eval(pca1*pars1,pca2*pars2)

    nmc1 = nmc(a1);
    nmc2 = nmc(a2);
    nmce = eval(pca1*nmc1, pca2*nmc2)

    ldc1 = ldc(a1);
    ldc2 = ldc(a2);
    ldce = eval(pca1*ldc1,pca2*ldc2)

    qdc1 = qdc(a1);
    qdc2 = qdc(a2);
    qdce = eval(pca1*qdc1, pca2*qdc2)

    fisher1 = fisherc(a1);
    fisher2 = fisherc(a2);
    fishere = eval(pca1*fisher1,pca2*fisher2)

    log1 = loglc(a1);
    log2 = loglc(a2);
    loge = eval(pca1*log1,pca2*log2)

    tree1 = treec(a1);
    tree2 = treec(a2);
    treee = eval(pca1*tree1,pca2*tree2)
    
    %nn1 = neurc(a1);
    %nn2 = neurc(a2);
    %nne = eval(pca1*nn1,pca2*nn2)

function e = eval(w1,w2)
    %low1 = nist_eval('my_rep',w1,10);
    high1 = nist_eval('my_rep',w1,100);
    %low2 = nist_eval('my_rep',w2,10);
    high2 = nist_eval('my_rep',w2,100);
    e = [high1 high2];
end