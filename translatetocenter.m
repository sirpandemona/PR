function dataset = translatetocenter(dataset,length,margin)
    s = size(dataset);
    middle = length/2+0.5;
    cog = centerofgravity(dataset);
    for i = 1:s(1)
        newdataset = dataset;
        movehorizontal = round(max(min(middle-cog(i,1),margin),-margin));
        movevertical = round(max(min(middle-cog(i,2),margin),-margin));
        move = movehorizontal*length+movevertical;
        for j = 1:length*margin+margin+move
            newdataset(i,j) = 0;
        end
        for j = length*margin+margin+1:length*(length-margin)-margin
            newdataset(i,j+move) = dataset(i,j);
        end
        for j = length*(length-margin)-margin+1+move:length*length
            newdataset(i,j) = 0;
        end
        dataset = newdataset;
    end
end