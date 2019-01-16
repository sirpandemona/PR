% clear all
% clc
% m = prnist([0:9],[1:40:1000]);

function a = curve_rep(m)
b= data2im(m);
dim = size(b);
imageCount = dim(2);
for j = 1:imageCount
boundaries = bwboundaries(cell2mat(b(j)),'noholes');
    
x = boundaries{1}(:, 2);
y = boundaries{1}(:, 1);


segmentCount= 40;

segmentSize = floor(size(x)/segmentCount);
segmentSize = segmentSize(1);

for k = 1 : segmentCount
    i=k-1;
  theseX = x(1+i*segmentSize:segmentSize*(i+1));   
  theseY = y(1+i*segmentSize:segmentSize*(i+1));   
%   Get a fit.
  warning('off','all')
  coefficients = polyfit(theseX, theseY, 2);
  warning('on','all')
%   Get the curvature
  curvatures(j,k) = coefficients(1);
end

%  k = [1:segmentCount];
%     i=k-1;
%   theseX(1:segmentSize,k) = x(1+i*segmentSize:segmentSize*(i+1));   
%   theseY(1:segmentSize,k) = y(1+i*segmentSize:segmentSize*(i+1));   
%   % Get a fit.
%   warning('off','all')
%   coefficients(:,k) = polyfit(theseX, theseY, 2)';
%   warning('on','all')
%   % Get the curvature
%   curvatures(j,:) = coefficients(k,1);

end

a = prdataset(curvatures, getlab(m));
end

% w =ldc(a);
% nist_eval('curve_rep',w,10)