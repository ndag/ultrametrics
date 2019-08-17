function A = max_subdominant_ultra(A)

n = length(A(1,:));

%after iteration k, A has maxmin paths that only use vertices 1:k as intermediate vertices
for k = 1:n
	% maxmin path from i->j that uses vertices 1:k has the same value as either the :
	%
	% path from i->j that only uses 1:(k-1)
	%	or
	% min of path from i->k and path from k->j
	%
	% otherwise there is a path with a greater min, but if it doesn't use k
	% it can't be greater than the first expression and if it does use k then 
	% it divides the path into two paths from i->k and k->j, each of which 
	% can't have greater mins than the second expression
	A = min(A,max(repmat(A(:,k),1,n),repmat(A(k,:),n,1)));
end
end
