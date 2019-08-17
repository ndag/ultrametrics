function uXt = quotientUM(uX,t)
lnk = linkage(squareform(uX));
I = cluster(lnk,'Cutoff',t,'Criterion','distance');
Xt = unique(I);
ex = zeros(1,length(Xt));
for i=1:length(Xt)
    J = find(I==i);
    ex(i) = J(1); 
end
uXt = uX(ex,ex);
