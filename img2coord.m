function coords =  img2coord(img)
    dims = size(img);
    lincoords =  find(img == 1);
    [X, Y] = ind2sub(dims, lincoords);
    coords = [X Y];
end