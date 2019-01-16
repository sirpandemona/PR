function [ boundary, imageCount] = boundaries( m )
b= data2im(m);
dim = size(b);
imageCount = dim(2);
for j = 1:imageCount
 boundary{j} = bwboundaries(cell2mat(b(j)),'noholes');
end
end

