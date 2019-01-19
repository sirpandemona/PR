function a = my_rep(m)
    b = im_box(m,[],1);
    c = im_resize(b,[32,32]);
    a = prdataset(c);
end