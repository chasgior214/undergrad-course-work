% Quiz 2, Question 1
%a
    
x1=-6:0.1:6;

fx1 = -x1.^4+30.*(x1.^2)+25.*x1-100

%b
left_int=0;
for n=1:120
left_int = left_int+fx1(n)*0.1;

end
left_int

%c

fx2 = @(x2) -x2.^4+30.*x2.^2+25.*x2-100


%d

fplot(fx2,[-6 6])
xlabel('x')
ylabel('f(x)')