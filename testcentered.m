s1 = prnist([0:9],[1:10]);

a1 = centered_dataset(s2,24,4);

pca1 = pca(a1);
a1 = a1*pca1;

[knn1,k1,e1] =knnc(a1,1);
knne = eval(pca1*knn1)

    %pars1  = parzenc(a1,1);
    %parse = eval(pca1*pars1)

    %nmc1 = nmc(a1);
    %nmc2 = nmc(a2);
    %nmce = eval(pca1*nmc1, pca2*nmc2)

%     ldc1 = ldc(a1);
%     ldc2 = ldc(a2);
%     ldce = eval(pca1*ldc1,pca2*ldc2)
% 
%     qdc1 = qdc(a1);
%     qdc2 = qdc(a2);
%     qdce = eval(pca1*qdc1, pca2*qdc2)
% 
%     fisher1 = fisherc(a1);
%     fisher2 = fisherc(a2);
%     fishere = eval(pca1*fisher1,pca2*fisher2)
% 
%     log1 = loglc(a1);
%     log2 = loglc(a2);
%     loge = eval(pca1*log1,pca2*log2)
% 
%     tree1 = treec(a1);
%     tree2 = treec(a2);
%     treee = eval(pca1*tree1,pca2*tree2)
    
    %nn1 = neurc(a1);
    %nn2 = neurc(a2);
    %nne = eval(pca1*nn1,pca2*nn2)

function high1 = eval(w1)
    %low1 = nist_eval('my_rep',w1,10);
    high1 = nist_eval('centered_dataset',w1,100);
end