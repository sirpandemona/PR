traindata = prnist([0:9],[1:150]);
testdata = prnist([0:9],[151:200]);
trainrepre = my_rep(traindata);
testrepre = my_rep(testdata);
classifier = ldc(trainrepre);
[error,vector] = testd(trainrepre,classifier)
[error,vector] = testd(testrepre,classifier)
nist_eval('my_rep',classifier,10)