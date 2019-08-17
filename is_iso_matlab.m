function b = is_iso_matlab(u1,u2)

%% possible bug (relatively).
 if(size(u1,1) == 1)
     b = (size(u2,1)==1);
     return;
 end


 g1 = biograph(u1);
 g2 = biograph(u2);
 
 b = isomorphism(g1,g2);