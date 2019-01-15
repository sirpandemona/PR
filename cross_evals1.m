%s1 = gen_dataset(1000,false);
%data =  my_rep(s1);

c = 10;
n = 1000;
cvIdx = crossvalind('Kfold',n,c);
errs = zeros(c,8);
for i=1:c
    testIdx = find(cvIdx ==i);
    trainIdx = find(cvIdx ~=i);
    trainData = prnist([0:9],trainIdx);
    testData = prnist([0:9],testIdx);

    a = my_rep(trainData);
    a_t = my_rep(testData);  
    pcaT = pca(a);
    a = a*pcaT;
    a_t = a_t * pcaT;
    
    [knn1,k1,e1] =knnc(a,1);
    pars1  = parzenc(a,1);
    nmc1 = nmc(a);
    ldc1 = ldc(a);
    qdc1 = qdc(a);
    fisher1 = fisherc(a);
    log1 = loglc(a);
    tree1 = treec(a);

    knne = evalc(knn1,a_t);
    parse = evalc(pars1,a_t);
    nmce = evalc(nmc1, a_t);
    ldce = evalc(ldc1,a_t);
    qdce = evalc(qdc1, a_t);
    fishere = evalc(fisher1,a_t);
    loge = evalc(log1,a_t);
    treee = evalc(tree1,a_t);
    
    errs(i,:) = [knne parse nmce ldce qdce fishere loge treee]; 
end

avgErrs = mean(errs,1)

function e = evalc(w,testData)
    true_labels = getlabels(testData);
    ass_labels = testData * w * labeld;   
    incorrPreds = ass_labels(:,7) ~= true_labels(:,7);
    e = sum(incorrPreds)/size(incorrPreds,1);
end