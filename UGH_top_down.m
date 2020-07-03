function d = UGH(ux,uy)

d=0;

spec = unique([unique(ux(:)); unique(uy(:))]);
spec = sort(spec,'descend')

ns = length(spec);

for c=1:ns
    t = spec(c);
    
    subux = quotientUMFPS(ux,t);
    subuy = quotientUMFPS(uy,t);
    
    if ~is_iso(subux,subuy)
        d = spec(max([c-1,1]));
        %d = spec(c);
        return
    end
end
