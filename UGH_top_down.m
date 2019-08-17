function d = UGH(ux,uy)

spec = unique([unique(ux(:)); unique(uy(:))]);
spec = sort(spec,'descend')

ns = length(spec);

for c=1:ns
    t = spec(c)
    
    subux = quotientUM(ux,t-eps);
    subuy = quotientUM(uy,t-eps);
    
    if ~is_iso_matlab(subux,subuy)
        d = t;
        return
    end
end