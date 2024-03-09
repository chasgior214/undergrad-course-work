%Exam Problem 5
%Part A
pointsx = [3 5 11 20 25];
pointsy = [6.46 8.99 14.44 16.62 14.72];

plot(pointsx, pointsy, 'go')
xlim ([0 30])
ylim([0 20])


%Part B
hold on
funcTerms = polyfit(pointsx,pointsy,4);
func = @(x) funcTerms(1).*x^4+funcTerms(2).*x^3+funcTerms(3).*x^2+funcTerms(4).*x+funcTerms(5);
fplot(func,'r--')


%Part C
% The initial height as seen on thr graph is 2 units of lenth measurement in the
% positive y-direction


%Part D
negatedFunc = @(x) -(funcTerms(1).*x^4+funcTerms(2).*x^3+funcTerms(3).*x^2+funcTerms(4).*x+funcTerms(5));
xhmax = goldmin(negatedFunc,0,30);
hmax = func(xhmax)


%Part E
plot(xhmax,hmax,'bo')