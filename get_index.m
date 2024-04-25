function index=get_index(vec,val)
for i =1:length(vec)
	if vec(i)==val
		index=i;
		break
	end
end

end