% Quiz 3, Question 2

%Variables given (part a)
y=4716;
j=1401;
m=2;
n=12;
r=4;
p=1461;
v=3;
u=5;
s=153;
w=2;
B=274277;
C=-38;

%Set the JDN Here:
JDN = 2361222;

%Equations given (part b)
fJulian = JDN+j;
fGregorian = JDN + j + floor((3*((4*JDN+B)/146097))/4) + C;
eJ = r*fJulian+v;
eG= r*fGregorian+v;
gJ=floor(mod(eJ,p)/r);
gG=floor(mod(eG,p)/r);
hJ=u*gJ+w;
hG=u*gG+w;

%Calculating days (part c)
%Julian DN to J & G dates
JulianDay = floor(mod(hJ,s)/u)+1;
JulianMonth = mod(floor(hJ/s)+m,n)+1;
JulianYear = floor (eJ/p-y+(n+m-JulianMonth)/n);
GregorianDay = floor(mod(hG,s)/u)+1;
GregorianMonth = mod(floor(hG/s)+m,n)+1;
GregorianYear = floor (eG/p-y+(n+m-GregorianMonth)/n);


%Output (part d)
fprintf('The requested date is day %d of month %d of the year %d in the Gregorian Calendar and day %d of month %d of the year %d in the Julian Calendar.',GregorianDay,GregorianMonth,GregorianYear,JulianDay,JulianMonth,JulianYear)