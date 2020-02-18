function R = Find_Corr(uy,ux,eps)
% Find_Corr - finds a correspondence with distortion less than eps between two ultrametrics
%
% R = Find_Corr(uy,ux,eps)
%
%	uy - (nuy x nuy) ultrametric distance matrix
%	ux - (nux x nux) ultrametric distance matrix
%	eps - maximum allowed distortion
%
% Returns:
%	R - (nuy x nux) correspondence or 0
%

ZX = linkage(squareform(ux));
ZY = linkage(squareform(uy));

diam_x = max(ZX(:,3));
diam_y = max(ZY(:,3));

swapped = 0;
if(diam_y > diam_x)
	ztmp = ZX;
	utmp = ux;
	dtmp = diam_x;
	ZX = ZY;
	ux = uy;
	diam_x = diam_y;
	ZY = ztmp;
	uy = utmp;
	diam_y = dtmp;
	swapped = 1;
end
	
nux = length(ux(:,1));
nuy = length(uy(:,1));

R = 0;
if(abs(diam_x-diam_y) > eps)
	return;
elseif( eps > max(diam_x,diam_y) )
	R = ones(nuy,nux);
	if(swapped)
		R = R';
	end
	return;
end


TX = cluster(ZX,'Cutoff',diam_x-1E-10,'Criterion','distance');
TY = cluster(ZY,'Cutoff',diam_x-eps-1E-10,'Criterion','distance');

NX = length(unique(TX));
NY = length(unique(TY));

subspace_x = cell(1,NX);
%img_pts{i} is the points in the i'th subspace of X
img_pts = cell(1,NX);
for i=1:NX
	subspace_x{i} = ux(TX==i,TX==i);
	img_pts{i} = find(TX==i);
end

R_found = 0;
for i=0:(NX^NY-1)

	%make fn the i'th function from {1..NY}->{1..NX}
	fn = zeros(1,NY);
	num = i;
	for digit_place = 1:NY
		digit = rem(num,NX);
		num = floor(num/NX);
		fn(digit_place) = digit+1;
	end

	%if it isn't a surjection continue loop
	if(~all(ismember(1:NX,fn)))
		continue;
	end

	% for all j, dis of fn from fn^-1[X_j] to X_j
	% must be no greater than eps
	large_dis = 0;
	sub_R = cell(1,NX);
	preimg_pts = cell(1,NX);
	for j=1:NX
		preimg_clusters = find(fn==j);
		preimg_pts{j} = find(ismember(TY,preimg_clusters));
		if(isempty(preimg_pts{j})) continue; end;
		subspace_y = uy(preimg_pts{j},preimg_pts{j}); 

		%recurse
		sub_R{j} = Find_Corr(subspace_y,subspace_x{j},eps);
        
		if(sub_R{j} == 0)
			large_dis = 1;
			break;
		end
	end
	
	if(~large_dis)
		R_found = 1;
		break;
	end
end

%fn(i) is where subspace i is mapped
%sub_R{i} is corr between X_i and the preimage of X_i
if(R_found)
	R = zeros(nuy,nux);
	for j=1:NX
		R(preimg_pts{j},img_pts{j}) = sub_R{j};
	end
end

if(swapped)
	R = R';
end

end
