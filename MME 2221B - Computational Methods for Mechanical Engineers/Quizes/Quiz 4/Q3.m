%Question 3
%Part A


A=[0.55,0.25,0.25;0.3,0.45,0.2;0.15,0.3,0.55];
b=[4800;5800;5700];


%Part B

%The GaussNaive function used is a perfect copy of the provided one
[solngn] = GaussNaive(A,b)

%Part C

[solnld] = A\b