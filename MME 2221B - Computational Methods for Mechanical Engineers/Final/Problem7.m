%Exam Problem 7
%Part A
dy = @(t,y) [y(2); -(c*y(2)+k*y(1))/30];


%Part B
k=45;
c=[1 31 60];


dyspecific1 = @(t,y) [y(2); -(c(1)*y(2)+k*y(1))/30];
[solnt1,solnx1] = ode45(dyspecific1,[0 30],[1.5 0]);

dyspecific1 = @(t,y) [y(2); -(c(2)*y(2)+k*y(1))/30];
[solnt2,solnx2] = ode45(dyspecific1,[0 30],[1.5 0]);

dyspecific1 = @(t,y) [y(2); -(c(3)*y(2)+k*y(1))/30];
[solnt3,solnx3] = ode45(dyspecific1,[0 30],[1.5 0]);


subplot(2,1,1)
plot(solnt1, solnx1(:,1))
xlabel('Time (s)')
ylabel('Displacement from Equilibrium (m)')
legend('Damping Coefficient = 1N*m/s')


%Part C
%I chose c=31 as while it over shot a little, it wsa the one that returned
%quickest with minimal overshoot

dyspecific4 = @(t,y) [y(2); -(31*y(2)+10*y(1))/30];
[solnt4,solnx4] = ode45(dyspecific4,[0 15],[1.5 0]);

dyspecific5 = @(t,y) [y(2); -(31*y(2)+30*y(1))/30];
[solnt5,solnx5] = ode45(dyspecific5,[0 15],[1.5 0]);

dyspecific6 = @(t,y) [y(2); -(31*y(2)+50*y(1))/30];
[solnt6,solnx6] = ode45(dyspecific6,[0 15],[1.5 0]);

subplot(2,1,2)
hold on
plot(solnt4, solnx4(:,1))
plot(solnt5, solnx5(:,1))
plot(solnt6, solnx6(:,1))
xlabel('Time (s)')
ylabel('Displacement from Equilibrium (m)')
legend('Spring Constant = 10 N/m','Spring Constant = 30 N/m','Spring Constant = 50 N/m')

