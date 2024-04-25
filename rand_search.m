function minima=rand_search(f,p ,n)
% f - our function we minimize 
% if p=[a,b] we've got 1d domain
% if p=[a b c d] we've got 2d domain [a,b]x[c,d]
% n - number of points  'in a row' (we've got n^2 points for 2d)

if length(p)==2
	a=p(1);b=p(2);
	X=rand(1,n)*(b-a)+a;

		Y=f(X);
		glob_min=min(Y);
		index=get_index(Y,glob_min);
		minima=X(index);
	
end


if length(p)==4
a=p(1);b=p(2);c=p(3);d=p(4);
	X1=rand(1,n.*n).*(b-a)+a;
	X2=rand(1,n.*n).*(c-d)+c;

%		Y=zeros(1,n.*n);
%		for i = 1:(n.*n)
%			Y(i)=f(X1(i), X2(i));
%		end
%% instead loop above - just evaluation
		Y=f(X1,X2);

		glob_min=min(Y);
		index=get_index(Y,glob_min);
		minima1=X1(index);
		minima2=X2(index);
		
		minima(1)=minima1;
		minima(2)=minima2;

end
end

