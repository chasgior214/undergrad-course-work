% Quiz 3, Question 1

[r,theta] = cart2polar (-1,-2)

function [r, theta] = cart2polar(x,y)
%Calculate r (part a)
r=sqrt(x.^2+y.^2);

%Calculate theta (part b)
if (x==0)&&(y==0)
    theta=0;
elseif (x==0)&&(y<0)
    theta=-pi/2;
elseif (x==0)&&(y>0)
    theta=pi/2;
elseif (x<0)&&(y==0)
    theta = pi;
elseif (x<0)&&(y<0)
    theta = atan (y/x)-pi;
elseif (x<0)&&(y>0)
    theta = atan(y/x)+pi;
else
    theta = atan(y/x);
end

%Convert to degrees (part c)
theta = 180*theta/pi;

end