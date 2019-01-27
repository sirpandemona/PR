%Init parameters
c = 10;
n = 10000;
testCrossEval = false;
%Init dataset
data = prnist([0:9],1:1000);
C = my_rep(data);
%Get Estimated Error using Cross Evaluation
if(testCrossEval)
    %Get indixes for cross evaluation
    cvIdx = crossvalind('Kfold',n,c);
    errs = zeros(c,8);

    for i=1:c
        %init test set and training set
        testIdx = find(cvIdx ==i);
        trainIdx = find(cvIdx ~=i);
        a = C(trainIdx,:);
        a_t = C(testIdx,:);

        %Feature reduce both sets using PCA
        pcaT = pca(a);
        a = a*pcaT;
        a_t = a_t * pcaT;

        %Train the 1-NN classifier
        [nn11,k11,e11] =knnc(a,1);
        %Train other classifiers for baseline
        pars1  = parzenc(a,1);
        nmc1 = nmc(a);
        ldc1 = ldc(a);
        qdc1 = qdc(a);
        fisher1 = fisherc(a);
        log1 = loglc(a);
        tree1 = treec(a);

        %Evaluate the classifiers using the test data
        nn1e = evalc(nn11,a_t);
        parse = evalc(pars1,a_t);
        nmce = evalc(nmc1, a_t);
        ldce = evalc(ldc1,a_t);
        qdce = evalc(qdc1, a_t);
        fishere = evalc(fisher1,a_t);
        loge = evalc(log1,a_t);
        treee = evalc(tree1,a_t);

        %Save all the errors
        errs(i,:) = [nn1e parse nmce ldce qdce fishere loge treee] ;
    end
    %output the mean errors of the cross evaluation
    avgErrs = mean(errs,1)
end
%Get Benchmark error
    
%Feature reduce the entire dataset using PCA
pcaN = pca(C);
C = C*pcaN;
%Train classifier
[knn1,k1,e1] =knnc(C,1);
%Call the benchmark function
error = nist_eval('my_rep',pcaN*knn1,100);

%Given classifier 'w' and testData, return the error rate of the classifier
%on the training data
function e = evalc(w,testData)
    true_labels = getlabels(testData);
    ass_labels = testData * w * labeld;   
    incorrPreds = ass_labels(:,7) ~= true_labels(:,7);
    e = sum(incorrPreds)/size(incorrPreds,1);
end