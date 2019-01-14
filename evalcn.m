function e = evalcn(w,n)
    data = gen_dataset(n,false);
    a = my_rep(data);
    true_labels = getlabels(a);
    ass_labels = a * w * labeld;   
    incorrPreds = ass_labels(:,7) ~= true_labels(:,7);
    e = sum(incorrPreds)/size(incorrPreds,1);
end