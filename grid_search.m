function minima=grid_search(f,p ,n)
% f - our function we minimize 
% if p=[a,b] we've got 1d domain
% if p=[a b c d] we've got 2d domain [a,b]x[c,d]
% n - number of points in a row (we've got n^2 points for 2d)

if length(p)==2
	X=linspace(p(1),p(2),n) ;
	
		Y=f(X);
		glob_min=min(Y);
		index=get_index(Y,glob_min);
		minima=X(index);
end


if length(p)==4

	X1=linspace(p(1),p(2),n) ;
	X2=linspace(p(3),p(4),n) ;

%		Y=zeros(n);
%		for i=1:n
%			for j=1:n
%			Y(i,j)=f(X1(i),X2(j));
%			end
%		end
%% edit: instead of loop above I used meshgrid
	[AA BB] = meshgrid(X1,X2);
	Y=f(AA,BB);

		
		min_in_column=min(Y); 
		
		glob_min=min(min_in_column);
		col_index=get_index(min_in_column,glob_min);
		row=Y(1:end,col_index);
		row_index=get_index(row,glob_min);
		minima1=X1(col_index);
		minima2=X2(row_index);
		
		minima(1)=minima1;
		minima(2)=minima2;

end
end





