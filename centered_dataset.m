function ds = centered_dataset(df,arguments)
    length = arguments(1);
    margin = arguments(2);
    df = im_bdilation(df);
    df = im_box(df,0,1);
    %df = im_rotate(df);
    %figure(1); show(df);
    df = im_resize(df,[length-2*margin length-2*margin],'nearest');
    %figure(2); show(df);
    df = im_resize(df,[length length],'preserve');
    %figure(3); show(df);
    ds = prdataset(df);
    ds = translatetocenter(ds,length,margin);
    figure(4); show(ds);
end