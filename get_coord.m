function coords = get_coord(img)
    dim = size(img);
    idx = find(img);
    [X, Y ] = ind2sub(dim,idx);
    coords = [X;Y];
end