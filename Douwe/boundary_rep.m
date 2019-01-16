% m = prnist([0:9],[1:100:1000]);

function a = boundary_rep(m)
boundary = boundaries(m);

a = prdataset(boundary, getlab(m));
end

