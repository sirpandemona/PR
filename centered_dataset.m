function a = centered_dataset(datafile,length,margin)
    %datafile = im_bdilation(datafile);
    b = im_box(datafile,[],1);
    c = im_resize(b,[length-2*margin,length-2*margin],'nearest');
    %d = im_box(c,margin,1);
    d = im_resize(c,[length,length],'preserve');
    e = prdataset(d);
    a = translatetocenter(e,length,margin);
end