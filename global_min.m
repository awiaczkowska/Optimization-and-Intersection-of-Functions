M=100;

f1 = @(x,y) ackley([x,y]);
f2 = @(x,y) michal([x,y]);
f3 = @(x,y) crossit([x,y]);
F={f1,f2,f3};
name={'ackley','michal','crossit'};
name2={'Ackley function','Michalewicz function','Cross-in-tray function'};
Number_of_pts=(2:100).^2;

d1=[-32.768, 32.768, -32.768, 32.768];
d2=[0,pi,0,pi];
d3=[0,10,0,10];
D={d1,d2,d3};

t1= [0 0];
t2=[2.2, 1.57];
t3=[1.3491,1.3491];
T={t1,t2,t3};

G=ones(3,M);
R=ones(3,M);
C=ones(3,M);

for i=1:3

f=F{i};d=D{i};
true_val=T{i};

	for n= 2:(M+1)
		nr=n-1;
		g=grid_search(f,d,n);
		r=rand_search(f,d,n);
		h=chebfun2(f,d,[n-1 n-1]);
		[minval,c]=min2(h);
		
		G(i,nr)=norm(g-true_val);
		R(i,nr)=norm(r-true_val);
		C(i,nr)=norm(c-true_val);
	end
	fig=figure();clf;
	semilogy(Number_of_pts,G(i,1:M-1), 'r--')
	hold on
	grid on
	semilogy(Number_of_pts,R(i,1:M-1), 'b')
	semilogy(Number_of_pts,C(i,1:M-1), 'magenta')
	legend('grid search', 'random search', 'chebfun2')
	title(name2{i})
	xlabel('Amount of evalueted points')
	ylabel('distance of computed min. form actual global min.')
	hold off
	saveas(fig,name{i},'jpg')
end


