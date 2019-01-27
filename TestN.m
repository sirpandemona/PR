N = [200 300 400 500 600 700 800 900 1000];
I = 5;
c = 10;
NL = size(N,2);
errs = [];
for i  =1:I
    for ni = 1:NL
        n = N(ni);
        cvIdx = crossvalind('Kfold',10*n,c);
        s = gen_dataset(n,false);
        C = my_rep(s);
        err = [];
        for j=1:c
            testIdx = find(cvIdx ==j);
            trainIdx = find(cvIdx ~=j);
            a = C(trainIdx,:);
            a_t = C(testIdx,:);
            pc = pca(a);
            a = a*pc;
            a_t = a_t*pc;
            [knn,~,~] =knnc(a,1);
            e = evalc(knn,a_t);
            err(j) = e;
        end
        errs(ni,i) = mean(err);
    end
end

function e = evalc(w,testData)
    true_labels = getlabels(testData);
    ass_labels = testData * w * labeld;   
    incorrPreds = ass_labels(:,7) ~= true_labels(:,7);
    e = sum(incorrPreds)/size(incorrPreds,1);
end