n = 30
eps = 0.05
Y = randn(n,3);
perturbation = eps/2*rand(n,3);
X = Y+perturbation;

dy = L2_distance(Y',Y');
uy = max_subdominant_ultra(dy);

% force zero diagonal
uy = uy.*(1-eye(length(uy)));


dx = L2_distance(X',X');
ux = max_subdominant_ultra(dx);

% force zero diagonal
ux = ux.*(1-eye(length(ux)));

P = randperm(n);
ux = ux(P,P);

tic;
R = Find_Corr(uy,ux,eps);
elapsed_time = toc
distortion = dis(uy,ux,R)
