function b = is_iso(u1,u2)

	if(size(u1,1) == 1)
		b = (size(u2,1)==1);
		return;
	end

	lk1 = linkage(squareform(u1));
	lk2 = linkage(squareform(u2));

	EPS = 1e-12;

	d1 = max(lk1(:,3));
	d2 = max(lk2(:,3));
	
	if(abs(d1-d2) > EPS)
		b = 0;
		return;
	end

	t1 = cluster(lk1,'Cutoff',d1-1E-10,'Criterion','distance');
	t2 = cluster(lk2,'Cutoff',d2-1E-10,'Criterion','distance');

	n = max(t1);
	if(n ~= max(t2))
		b=0;
		return;
	end

	em = zeros(n);
	
	for i=1:n
		indi = find(t1 == i);
		subu1 = u1(indi,indi);
		for j=1:n
			indj = find(t2 == j);
			subu2 = u2(indj,indj);
			em(i,j) = is_iso(subu1,subu2);
		end
	end

	b = contains_perm(em);
end
