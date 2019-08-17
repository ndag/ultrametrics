nx = 10
ny = 100


nc = 100; % number points per cluster
nb = 5 % number of clusters (each with diam 1)
sep = 1.2 % cluster separation


%%
figure;


n = max(nx,ny);

%% will generate two ultrametrics simulating nb clusters at distance sep
Z = [];
for k=1:nb
Z = [Z; (k-1)*sep + rand(nc,1)];
end

nz = length(Z);

dz = L2_distance(Z',Z');
uz = max_subdominant_ultra(dz);



rx = randperm(nz);
Ix = rx(1:nx);
ux = uz(Ix,Ix);
ux = ux.*(1-eye(length(ux)));

ry = randperm(nz);
Iy = ry(1:ny);
uy = uz(Iy,Iy);
uy = uy.*(1-eye(length(uy)));






%% run uGH
tic;
U = UGH_top_down(ux,uy);
%U = UGH(ux,uy);
elapsed_time = toc
U

%% vizualize U

diam = max(max(ux(:)),max(uy(:)));

lnky = linkage(squareform(uy));
subplot(1,2,1), dendrogram(lnky,0,'ColorThreshold',U+eps); title('Y')
axis([0 ny 0 diam])



lnkx = linkage(squareform(ux));
subplot(1,2,2), dendrogram(lnkx,0,'ColorThreshold',U+eps); title('X')
axis([0 nx 0 diam])


subplot(1,2,1), 
L = line([0,n],[U,U]);
set(L,'linewidth',5,'Color','red');
L.Color(4) = .2;

subplot(1,2,2), 
L = line([0,n],[U,U]);
set(L,'linewidth',5,'Color','red');
L.Color(4) = .2;


