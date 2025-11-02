clc; clear;

F = 50000;       
m = 1;        
g = 9.81;        
t_thrust = 10;   
t_end = 100;      
dt = 1;          
t = 0:dt:16;

% create array
v = zeros(1,length(t));  % Velocity
h = zeros(1,length(t));  % altitude

% Acceleration during thrust
a_thrust = F/m - g;

% Simulation loop
for i = 2:length(t)
    if t(i) <= t_thrust % i for indexing time array
        v(i) = v(i-1) + a_thrust * dt; % use step time not t while making array
        h(i) = h(i-1) + v(i-1)*dt+ 0.5*a_thrust*dt^2;
    else
        v(i) = v(i-1) - g * dt;
        h(i) = h(i-1) + v(i-1)*dt - 0.5*g*dt^2;
    end
end

% Find max altitude and velocity
[max_h, t_h] = max(h);
[max_v, t_v] = max(v);

% Altitude subplot
subplot(2,1,1);
plot(t, h, 'b');
hold on; % is for plotting two diff plots in same graph this is for max value
plot(t(t_h), max_h, 'ro');
xlabel('Time (s)');
ylabel('Altitude (m)');
title('Altitude vs Time');
legend('Altitude', 'Max Altitude');
grid on;

% Velocity subplot
subplot(2,1,2);
plot(t, v, 'g');
hold on; 
plot(t(t_v), max_v, 'mo');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time');
legend('Velocity', 'Max Velocity');
grid on;   % grid on for showing grid lines on graph

% Display max values
fprintf('Maximum Altitude = %.2f m at t = %.2f s\n', max_h, t(t_h));
fprintf('Maximum Velocity = %.2f m/s at t = %.2f s\n', max_v, t(t_v));
