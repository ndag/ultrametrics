function d = dis2(dx,dy,R)

nx = length(dx(:,1));
ny = length(dy(:,1));
d = 0;

[x,y] = find(R);
for i=1:length(x)
	for j=(i+1):length(x)
		vval = abs(dx(x(i),x(j)) - dy(y(i),y(j)));
		if(vval > 2.5)
			fprintf(1,'(%d,%d) and (%d,%d) -> %f\n',x(i),x(j),y(i),y(j),vval);
		end
		d = max(d,abs(dx(x(i),x(j)) - dy(y(i),y(j))));
	end
end
		
end
