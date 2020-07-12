function [d,R] = GromovHausdorff(dx,dy)
	nx = length(dx(1,:));
	ny = length(dy(1,:));
	gamma = zeros(nx*ny);
	for x1=1:nx
		for y1=1:ny
			for x2=1:nx
				for y2=1:ny
					r1 = (x1-1)*ny+y1;
					r2 = (x2-1)*ny+y2; 
					gamma(r1,r2) = abs(dx(x1,x2)-dy(y1,y2));
				end
			end
		end
	end

	thresholds = unique(gamma(:));

	%threshold(too_small) is always UNSAT unless dx ~ dy
        too_small = 1;
	%threshold(too_large) is always SAT 
        too_large = length(thresholds);


	R = is_iso(dx,dy);
	if(any(R~=0))
%		fprintf('\nX and Y are isometric!\n');
		d = 0;
		return;
	end

	%after this point in execution too_small is always UNSAT
	%and too_large is always SAT
%		fprintf('index interval = (%d,%d]\t neighborhood = (%f,%f]\n',too_small,too_large,thresholds(too_small)/2,thresholds(too_large)/2); 
        while(too_large-too_small > 1)
                mid = floor((too_large+too_small)/2);
		R_tmp = Find_Corr(dx,dy,thresholds(mid));
                if (any(R_tmp~=0))
                        too_large = mid;
			R = R_tmp;
                else 
                        too_small = mid;
                end
%		fprintf('index interval = (%d,%d]\t neighborhood = (%f,%f]\n',too_small,too_large,thresholds(too_small)/2,thresholds(too_large)/2); 
        end

        d = thresholds(too_large)/2;

end
