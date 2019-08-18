function uXt = quotientUMFPS(uX,t)

% implement a Farthest Point Sampling type of algorithm
% this is faster than using quotientUM.m which does it via Matlab's cluster
% function

uXt_big = uX;
uXt_big(uX<=t) = 0;

I = [1];
dI = uXt_big(1,:);

for k=1:length(uX)
    mx = max(dI);
    if mx == 0
        break
    end
    J = find(dI == mx);
    I = [I, J(1)];
    dI = min([dI;uXt_big(J(1),:)],[],1);
end


uXt = uX(I,I);
