% Quiz 2, Question 3

loan = [500000, 550000, 600000, 650000, 700000, 750000, ...
800000, 850000, 900000];

int = [1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0];


% PART A

cost=zeros(9);

for y=1:9
    for x=1:9
        cost(y,x)=loan(y)*int(x)/100;
    end
end

cost
% PART B

loan_amount=[100,1000,1000000]
interest=[1,2,3,4,5]

friend_cost=LoanCostCalculator(loan_amount,interest)

function [costs] = LoanCostCalculator(loan_amount,interest)
costs=ones(length(loan_amount),length(interest));

for y=1:length(loan_amount)
    for x=1:length(interest)
        costs(y,x)=loan_amount(y)*interest(x)/100;
        
    end
end
end
