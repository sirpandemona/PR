% m = prnist([0:9],[1:100:1000]);

function a = boundary_rep(m)
b= data2im(m);
dim = size(b);
imageCount = dim(2);
for j = 1:imageCount
 boundary = bwboundaries(cell2mat(b(j)),'noholes');
 boundaries(j,:) = boundary{1};
end

a = prdataset(boundaries, getlab(m));
end

