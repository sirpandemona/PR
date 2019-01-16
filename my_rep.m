function a = my_rep(m)
    b = im_box(m,[],1);
    c = im_resize(b,[16,16]);
    
    a = prdataset(c);
end