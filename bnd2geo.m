function newds = bnd2geo(data,dim)
    for i = 1: size(data,1)
       item = data{i,:};
       img = getdata(item);
       img = reshape(img,dim);
       coords = img2coord(img);
       cwIdx = clockwise_choice(coords);
       orderCoords = coords(cwIdx,:);
       
       
       P = calcPerimeter(orderCoords);
       A = size(find(img ==1),1); % surface is number of pixels in image
       roundness = P^2 / (4*pi*A);
       angles = calcAngles(orderCoords);
       curves = calcCurves(angles);
       bendEnergy = calcBE(P, curves);
       
       feats(i,:) = [P,A,roundness, bendEnergy(end)]';
    end
    newds = prdataset(feats, getlab(data));
end

function out = calcBE(P, k)
    n = size(k,2);
    out = [];
    out(1) = 0;
    for i = 2:n
        ki = k(1:i-1);
        out(i) = sum(ki.^2)/P;
    end
end

function out = calcCurves(theta)
    out = [];
    for i = 1:(size(theta,2)-1)
        out(i) = theta(i+1) - theta(i);
    end
end

function out = calcAngles(coords)
    theta = [];
    for i = 1:(size(coords,1)-1)
        xn = coords(i,1);
        yn = coords(i,2);
        xn1 = coords(i+1,1);
        yn1 = coords(i+1,2);
        
        theta(i) = atan((yn1 - yn)/(xn1-xn));
    end
    out = theta;
end

function out = calcPerimeter(coords)
out = 0;
    for i = 1: (size(coords,1)-1)
       out = out+norm( coords(i+1,:) - coords(i,:));
    end
    out = out + norm(coords(end,:) - coords(1,:));
end

