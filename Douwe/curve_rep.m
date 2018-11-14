function a = curve_rep(m)
b= data2im(m);
dim = size(b);
imageCount = dim(2);
for j = 1:imageCount
boundaries = bwboundaries(cell2mat(b(j)),'noholes');
    
x = boundaries{1}(:, 2);
y = boundaries{1}(:, 1);


segmentCount= 80;

segmentSize = floor(size(x)/segmentCount);
%
%k =10
for k = 1 : segmentCount
    i=k-1;
  theseX = x(1+i*segmentSize:segmentSize*(i+1));   
  theseY = y(1+i*segmentSize:segmentSize*(i+1));   
  % Get a fit.
  warning('off','all')
  coefficients = polyfit(theseX, theseY, 2);
  warning('on','all')
  % Get the curvature
  curvatures(j,k) = coefficients(1);
end
end

a = prdataset(curvatures, getlab(m));
end
