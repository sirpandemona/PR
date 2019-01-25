function ds = centered_dataset_rep(df)
    length = 24;
    margin = 4;
    %df = df*im_bdilation();
    df = df*im_box(0,1);
    %df = im_rotate(df);
    %figure(1); show(df);
    df = df*im_resize([length-2*margin length-2*margin],'nearest');
    %figure(2); show(df);
    df = df*im_resize([length length],'preserve');
    %figure(3); show(df);
    ds = prdataset(df);
    ds = translatetocenter(ds,length,margin);
end