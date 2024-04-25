
%f1 = @(x) (x.^2-1).*(x.^3); % polynomial
f2 = @(x) abs(abs(x)-1);
f3 = @(x) sin(pi*x);
f1 = @(x) x-1;

F={f1,f2,f3};
%F={f2,f3};

i=intersection_pts(F,[-1.5 1.5]);

X=linspace(-1.5,1.5,100);
fig=figure();
clf;
plot(X,f1(X),'red');
hold on
grid on
plot(X,f2(X),'blue');
plot(X,f3(X),'magenta');

plot(i, f2(i), '*g');
hold off

saveas(fig,'inters1','png')





