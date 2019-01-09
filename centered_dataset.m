function a = centered_dataset(datafile)
    b = im_box(datafile,[],1);
    c = im_resize(b,[16,16]);
    d = im_box(c,4,1);
    e = prdataset(d);
    a = translatetocenter(e);
end