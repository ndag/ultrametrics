function b = contains_perm(em)
% determines if (0-1) matrix em contains a permutation matrix

n = size(em,1);

%g is graph whose maxflox is n iff there is a perm
g = zeros(2*n+2);
for i=1:n
	g(1,2+i) = 1;
	g(2+i+n,2) = 1;
end
for i=1:n
	for j=1:n
		g(i+2,j+n+2) = em(i,j);		
	end
end

m = graphmaxflow(sparse(g),1,2);

b = (abs(m-n) < 0.001);

end
