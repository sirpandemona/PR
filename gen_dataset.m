function data = gen_dataset(n,r)
    idx = datasample(1:1000, n, 'Replace',r);
    data = prnist([0:9],idx);
end