
f = @(x) (x^2-2).*(x^3); % polynomial
% f=x^5 - 2x^3
sqrt(2) % numeric value of one of the roots

% time of built-in function
tic;
roots([1 0 -2 0 0 0])
toc;


F=chebfun(f,[-2,2]); % automatic degree
length(F)

%time of computing roots
tic;
roots(F)
toc;


% time overall of chebfun working on the roots
tic;
F=chebfun(f,[-2,2]); % automatic degree
roots(F)
toc;

