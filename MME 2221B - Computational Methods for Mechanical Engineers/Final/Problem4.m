%Exam Problem 4
%Part A
table = zeros(7,2);
table (:,1)=100:5:130;


%Part B
func = @(T) 7.4388*T+0.0025*T.^2;



%(Part of Part D:)
answer = tableSfill(table,func)

%Part C
function [tableSfilled] = tableSfill(table,func)

%Part D
h=0.00001;
for i = 1:length(table)
    tableSfilled(i,2)=(1/(2*h))*(func(table(i,1)+h)-(func(table(i,1)-h)));
    tableSfilled(i,1)=table(i,1);
end
end