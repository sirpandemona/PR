function cog = centerofgravity(dataset)
   s = size(dataset);
   cog(1:s(1),1:2) = 0;
   for i = 1:s(1)
       d = dataset(i,1:s(2));
       len = sqrt(s(2));
       sumhorizontal = 0;
       sumvertical = 0;
       total = sum(d);
       for j = 1:s(2)
           sumhorizontal = sumhorizontal + d(j) * ceil(j/len);
           sumvertical = sumvertical + d(j) * (mod(j-1,len)+1);
       end
       cog(i,1:2) = [sumhorizontal/total sumvertical/total];
   end
end