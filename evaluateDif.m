function [ConMat,errorrate] = evaluateDif(Dif,classes,k)
    [~,obj] = sort(Dif);
    obj = obj(1:k,:);
    freq = zeros(classes,size(Dif,2));
    ConMat = zeros(classes,classes);
    elementsperclasstrain = size(Dif,1)/classes;
    elementsperclasstest = size(Dif,2)/classes;
    for i = 1:k
        obj(i,:) = ceil(obj(i,:)/elementsperclasstrain);
    end
    if k == 1
        guess = obj(1,:);
    else
        for i = 1:size(Dif,2)
            for j = 1:k
                freq(obj(j,i),i) = freq(obj(j,i),i) + (k-j+1);
            end
        end 
        [~,guess] = max(freq);
    end
    for i = 1:classes
        for j = 1:elementsperclasstest
            ConMat(i,guess((i-1)*elementsperclasstest+j)) = ConMat(i,guess((i-1)*elementsperclasstest+j)) + 1;
        end
    end
    errorrate = 1-trace(ConMat)/size(Dif,2);
end

