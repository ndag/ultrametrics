load Us.mat

L = length(Us);

dm = zeros(L,L); %ugwslb
dm1 = zeros(L,L); %dgwslb
lab = zeros(1,L); % labels

for i=1:L
    i
    Xi = Us{i};
    ui = Xi.ux;
    lab(i) = Xi.nb; % use number of blocks as label
    for j=i+1:L
        j
        Xj = Us{j};
        uj = Xj.ux;
        dm(i,j) = UGH_top_down(ui,uj);
        
    end
end

dm = max(dm,dm');
[sl il] = sort(lab);
imagesc(dm(il,il)); title('uGH')
axis square

