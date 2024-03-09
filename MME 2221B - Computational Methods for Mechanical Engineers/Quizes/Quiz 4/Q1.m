%Question 1
%Part A

f=@(x) cos(sqrt(x));
g = @(x) x+cos(sqrt(x));

%Will be using an initial guess of 1, used fplot(f) to look for roots

%Kept decresing error incrementaly to make sure it didn't diverge,
%didn't go all the way till it did as the accuracy below seemed enough

%Note the SFPI function wasn't changed at all, so using the one I upload
%(a perfect copy of the provided one) or the provided one with this
%script won't change anything

[rootSFPI] = SFPI(g,1,0.0001);


%Part B

[rootfzero] = fzero(f,1);

%Part C

fprintf(['The root found using the SFPI function is %f, \nThe root found using the ' ...
    'fzero function is %f, \nAnd the error on the SFPI function assuming the fzero ' ...
    'function returns the actual root perfectly is %f%%.'],rootSFPI,rootfzero,(abs((rootfzero-rootSFPI)/rootfzero))*100)

%Part D


x=[-50:20];
y=f(x);
figure(1)
hold on
plot(x,y,'g.')
xlabel('x')
ylabel('f(x) = cosine of root x')
plot(rootSFPI,0,'bd')
plot(rootfzero,0,'m+')

