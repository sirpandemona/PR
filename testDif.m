dftrain = gen_dataset(10,false);
dftest = gen_dataset(10,false);
dstrain = centered_dataset(dftrain,[24 4]);
dstest = centered_dataset(dftest,[24 4]);
Dif = comparefigures(dstrain,dstest);
[a,b] = evaluateDif(Dif,10,1)