function dataset = translatetocenter(dataset)
    s = size(dataset);
    cog = middle(dataset);
    for i = 1:s(1)
        newdataset = dataset;
        movehorizontal = round(max(min(12.5-cog(i,1),4),-4));
        movevertical = round(max(min(12.5-cog(i,2),4),-4));
        move = movehorizontal*24+movevertical;
        newdataset(i,1:100+move) = 0;
        for j = 101:476
            newdataset(i,j+move) = dataset(i,j);
        end
        newdataset(i,477+move:576) = 0;
        dataset = newdataset;
    end
end