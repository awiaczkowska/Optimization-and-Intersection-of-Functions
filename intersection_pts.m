function A=intersection_pts(F_list,dom)
	f1=F_list{1};
	f2=F_list{2};
	h=@(x) f1(x)-f2(x);
	H=chebfun(h,dom,'splitting','on');
	A=roots(H);
	for i= 3: length(F_list)
		f=F_list{i};
		h=@(x) f1(x)-f(x);
		H=chebfun(h,dom,'splitting','off');
		B=roots(H);
		A=intersect(A,B);
	end
end

