% Quiz 3, Question 3
%Define function (part a)
deflection = @(x) -4*(2*x^4-3*400*x^3+x*400^3)/(48*52000*32000)

%Plot function (part b)
fplot(deflection, [0 400])
xlabel('x (cm)')
ylabel('deflection (cm)')

%Find largest negative-y deflection (part c)
xLocation = fminbnd(deflection,0,400)

%Output largest negative-y deflection (part d)
fprintf ('The largest deflection is %d cm and occurs at x = %d cm', deflection(xLocation), xLocation)

%Finding largest negative-y deflection using goldmin (part e)
%Note: must have goldmin function available
xLocationGoldmin = goldmin (deflection,0,400)