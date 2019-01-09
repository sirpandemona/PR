function a = my_rep(m)
    b = im_box(m,[],1);
    c = im_resize(b,[16,16]);
    d = im_box(c,4,1);
    a = prdataset(d);
end