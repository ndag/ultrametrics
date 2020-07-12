n = 30
eps = 0.30
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

max(ux(:))
max(max(abs(ux-uy)))
P = randperm(n);
ux = ux(P,P);


tic;
[distortion0,R] = GromovHausdorff(uy,ux);
elapsed_time = toc
distortion1 = dis(uy,ux,R)
