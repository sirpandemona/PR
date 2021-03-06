%s1 = prnist([0:9],[1:1000]);
dim = [32 32];
s1 = gen_dataset(1000,false);
s2 = gen_dataset(10,false);

a1 = my_rep(s1);
a2 = my_rep(s2);

%a1 = gen_bounds(a1,dim);
%a2 = gen_bounds(a2,dim);

%b2 = im_resize(a2, [16 16]);
%c2 = bnd2geo(b2,[16 16]);

pca1 = pca(a1);
pca2 = pca(a2);
a1 = a1*pca1;
a2 = a2*pca2;
%w1 = fisherm(a1);
%w2 = fisherm(a2);
%a1 = a1*w1;
% a2 = a2*w2;
% 
% 
[knn1,k1,e1] =knnc(a1,1);
[knn2,k2,e2] =knnc(a2,1);
knne = evalc(pca1*knn1,pca2*knn2)

%     pars1  = parzenc(a1,2);
%     pars2  = parzenc(a2,1);
%     parse = evalc(pca1*pars1,pca2*pars2)
% bay1 = naivebc(a1,5);
% bay2 = naivebc(a2,5);
% baye = evalc(pca1*bay1,pca2*bay2)
   % nmc1 = nmc(a1);
   % nmc2 = nmc(a2);
   % nmce = evalc(pca1*nmc1, pca2*nmc2)

   % ldc1 = ldc(a1);
   % ldc2 = ldc(a2);
   % ldce = evalc(pca1*ldc1,pca2*ldc2)

   % qdc1 = qdc(a1);
%     qdc2 = qdc(a2);
%     qdce = evalc(pca1*qdc1, pca2*qdc2)
% 
%     fisher1 = fisherc(a1);
%     fisher2 = fisherc(a2);
%     fishere = evalc(pca1*fisher1,pca2*fisher2)
% 
%     log1 = loglc(a1);
%     log2 = loglc(a2);
%     loge = evalc(pca1*log1,pca2*log2)
% 
%     tree1 = treec(a1);
%     tree2 = treec(a2);
%     treee = evalc(pca1*tree1,pca2*tree2)
    
    %nn1 = neurc(a1);
    %nn2 = neurc(a2);
    %nne = eval(pca1*nn1,pca2*nn2)

function e = evalc(w1,w2)
    
    high1 = evalcn(w1,100);
    high2 = evalcn(w2,100);
    %high1 = nist_eval('my_rep',w1,100);
    %high2 = nist_eval('my_rep',w2,100);
    e = [high1 high2];
end