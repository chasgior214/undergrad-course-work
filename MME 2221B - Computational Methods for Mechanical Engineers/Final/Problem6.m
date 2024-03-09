%Exam Problem 6

% PROBLEM 6 GIVEN
func1 = @(x) sin(1.2*x)+x;
func2 = @(x) x;

hold on
fplot(func1,[2 14])
fplot(func2,[2 14])
legend('y=sin(1.2x)+x','y=x','Location','northwest')
xlabel('x'), ylabel('y')


%Part A
func3 = @(x) sin(1.2*x); %< func1 - func2


%Part B
brackets = incsearch(func3,2,14);


%Part C
roots = zeros(length(brackets),1);
for i=1:length(brackets)
    roots(i)=bisect(func3,brackets(i,1),brackets(i,2));
end


%Part D
plot(roots, func2(roots),'go')