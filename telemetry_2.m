clc; clear;

% Simulation duration
time = 0:1:25;

% arrys for data store
l_time= length(time);
tempData = zeros(1, l_time);
voltData = zeros(1, l_time);
currData = zeros(1, l_time);


% simulation
for k = 1:l_time
    
    % random data 
    currentTemp = 20 + 10 * rand(1); % 20 to 30 C
    currentVolt = 6 + 0.6 * rand(1); % 6 to 6.6 V
    currentCurr = 0.1 + 0.4 * rand(1); % 0.1 to 0.5 A
    
    % store in arry
    tempData(k) = currentTemp;
    voltData(k) = currentVolt;
    currData(k) = currentCurr;

    % plots
    subplot(3, 1, 1); h1 = plot(time, tempData, 'r-'); title('Temperature'); ylabel('Temp (°C)'); grid on;
    subplot(3, 1, 3); h2 = plot(time, voltData, 'b-'); title('Voltage'); ylabel('Voltage (V)'); grid on;
    subplot(3, 1, 2); h3 = plot(time, currData, 'g-'); title('Current'); ylabel('Current (A)'); xlabel('Time (s)'); grid on;

    % second by second drawing
    drawnow;
   
end