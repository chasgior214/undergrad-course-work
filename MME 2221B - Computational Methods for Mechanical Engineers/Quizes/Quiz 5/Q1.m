%Part A: Fit a polynomial to correction factors

% given data for MME 2221 Quiz 5

% these are the temperature values which correspond to the correction factors below
temp = -20:5:50;  

% these are the correction factors for the T values provided above
correctionFactors = [3.283 3.183 2.909 2.49 2 1.516 1.111 0.862 0.842 1.127 1.793 2.913 4.564 6.82 9.755];

plot(temp,correctionFactors)

myPolyCoef = polyfit(temp,correctionFactors,3);
hold on
myPoly = @(x) (myPolyCoef(1,1))*x.^3+(myPolyCoef(1,2))*x.^2+(myPolyCoef(1,3))*x+(myPolyCoef(1,4))
fplot(myPoly)


%Part B: Find min correctional factor given by fitted curve

minValX = goldmin(myPoly,-20,50);
minVal = myPoly(minValX)

%Part C: Plot polynomial w points
clf
hold on
fplot(myPoly, [-20 50])
plot(minValX,minVal,'-o')


%Part D: Solve for positions at different temperatures



springConstants = [50,100,50];
masses = [60;70;80];
specificTemp = [minValX,-10,40];
xRelative = ones(3);

%loop begins here

for i=1:3
springConstantsAdjusted = myPoly(specificTemp(i))*[springConstants];

A=[springConstantsAdjusted(1)+springConstantsAdjusted(2),-springConstantsAdjusted(2),0;
    -springConstantsAdjusted(2),springConstantsAdjusted(2)+springConstantsAdjusted(3), -springConstantsAdjusted(3);
    0,-springConstantsAdjusted(3),springConstantsAdjusted(3)];
b = 9.81*[masses];

xRelative(i,:) = A\b;

end













