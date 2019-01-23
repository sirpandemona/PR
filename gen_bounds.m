function data = gen_bounds(ds, dims)
    s=strel('disk',1,0);
    s2 =strel('disk',2,0);
    data = [];
    for i = 1: size(ds,1)
       x = ds{i,:};
       a = getdata(x);
       dim = size(a);
       img = reshape(a,dims);
       D = im2bw(img);
       E = imclose(D,s2);
       F = imerode(D,s);
       bnd = double(D - F);
       x = setdata(x,reshape(bnd,dim));
       ds{i,:} = x;
    end
data = ds;
end