function e = evalgeneric(w,n,func,arguments)
    data = gen_dataset(n,false);
    a = func(data,arguments);
    true_labels = getlabels(a);
    ass_labels = a * w * labeld;   
    incorrPreds = ass_labels(:,7) ~= true_labels(:,7);
    e = sum(incorrPreds)/size(incorrPreds,1);
end