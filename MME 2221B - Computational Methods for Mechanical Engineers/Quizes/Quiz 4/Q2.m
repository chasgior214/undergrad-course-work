%Question 2
%Part A

random = [randn(1000,1)];

cdguesses = ones(1000,1);
cdguesses = cdguesses.*0.25;


for i = 1:1000
    cdguesses (i,1) = cdguesses(i,1)+0.05*random(i,1);
end

%Part B

foursecvelocity = zeros(1000,1);

for i = 1:1000
    foursecvelocity (i,1) = (sqrt(9.81*70/cdguesses(i)))*tanh(sqrt(9.81*cdguesses(i)/70)*4); 
end

%Part C

cdavg = mean(cdguesses);
foursecvelocityavg = mean (foursecvelocity);

%Part D

subplot(2,2,1), plot(cdguesses)
xlabel('Guess number')
ylabel('Drag Coefficient (kg/m)')
subplot(2,2,2), plot(foursecvelocity)
xlabel('Guess number')
ylabel('Velocity at 4 seconds (m/s)')


%Part E

subplot(2,2,[3,4]), 
linregr(cdguesses,foursecvelocity)
xlabel('Drag coefficient (kg/m)')
ylabel('Velocity at 4 seconds (m/s)')

%Note the linregr function as provided outputs sx and an ans not 
%assigned to any variable, and was not altered so that both
%the uploaded copy (a perfect copy of the provided one) and
%the provided one would work the exact same
