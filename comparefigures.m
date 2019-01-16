function Dif = comparefigures(trainfigures,testfigures)
    Dif = zeros(size(trainfigures,1),size(testfigures,1));
    for i = 1:size(trainfigures,1)
        for j = 1:size(testfigures,1)
            Dif(i,j) = sum(abs(trainfigures(i,:)-testfigures(j,:)));
        end
    end
end

