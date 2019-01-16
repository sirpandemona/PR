% m = prnist([0:9],[1:100:1000]);

function a = hausdorff_rep(m)
[boundary,imageCount] = boundaries(m);

for j= 1:imageCount
    for k=1:imageCount
        hausdorff_dist(j,k) = hausdorff(boundary{j}{1},boundary{k}{1});
    end
end

a = prdataset(hausdorff_dist, getlab(m));
end

