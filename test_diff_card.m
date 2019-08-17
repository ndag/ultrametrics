nX = 15
nY = 10
eps = .8

figure;


%% will generate two ultrametrics simulating two clusters at distance 2
nc = 100; % number points per cluster
Z = [rand(nc,2);
    2+rand(nc,2)];
nZ = length(Z);

rX = randperm(nZ);
IX = rX(1:nX);
X = Z(IX,:);

rY = randperm(nZ);
IY = rX(1:nY);
Y = Z(IY,:);

%% compute uy
dy = L2_distance(Y',Y');
uy = max_subdominant_ultra(dy);

% force zero diagonal
uy = uy.*(1-eye(length(uy)));

lnkY = linkage(squareform(uy));
subplot(3,1,1), dendrogram(lnkY,0), title('Y')

%% compute ux
dx = L2_distance(X',X');
ux = max_subdominant_ultra(dx);

% force zero diagonal
ux = ux.*(1-eye(length(ux)));

lnkX = linkage(squareform(ux));
subplot(3,1,2), dendrogram(lnkX,0), title('X')




%% run Find_Corr
tic;
R = Find_Corr(uy,ux,eps);
elapsed_time = toc
R

%% vizualize correspondence
if length(R) > 1
    
    
    
    subplot(3,1,3), spy(R), title('R')
    
    xticklabels = 1:nX;
    xticks = 1:nX;
    set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
    xlabel('X')
    
    yticklabels = 1:nY;
    yticks = 1:nY;
    set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
    ylabel('Y')
end
