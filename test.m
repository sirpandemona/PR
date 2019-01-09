s1 = prnist([0:9],[1:1000]);
s2 = prnist([0:9],[1:10]);

a1 = my_rep(s1);
a2 = my_rep(s2);

[knn1,k1,e1] =knnc(a1,1);
[knn2,k2,e2] =knnc(a2,1);
knne = eval(knn1,knn2)

    pars1  = parzenc(a1,1);
    pars2  = parzenc(a2,1);
    parse = eval(pars1,pars2)

    nmc1 = nmc(a1);
    nmc2 = nmc(a2);
    nmce = eval(nmc1, nmc2)

    ldc1 = ldc(a1);
    ldc2 = ldc(a2);
    ldce = eval(ldc1,ldc2)

    qdc1 = qdc(a1);
    qdc2 = qdc(a2);
    qdce = eval(qdc1, qdc2)

    fisher1 = fisherc(a1);
    fisher2 = fisherc(a2);
    fishere = eval(fisher1,fisher2)

    log1 = loglc(a1);
    log2 = loglc(a2);
    loge = eval(log1,log2);



function e = eval(w1,w2)
    low1 = nist_eval('my_rep',w1,10);
    high1 = nist_eval('my_rep',w1,100);
    low2 = nist_eval('my_rep',w2,10);
    high2 = nist_eval('my_rep',w2,100);
    e = [low1 high1 low2 high2];
end