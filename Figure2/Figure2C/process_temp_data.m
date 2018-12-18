%% Load the data
t = load('temps.mat');

t = t.temps;

%% Get the temps
fc1_indices = 1:3:length(t);
fc2_indices = 2:3:length(t);
fc3_indices = 3:3:length(t);

fc1_temps = t(fc1_indices);
fc2_temps = t(fc2_indices);
fc3_temps = t(fc3_indices);

%% Plot the temps
hold on
plot(fc1_temps)
plot(fc2_temps)
plot(fc3_temps)

hold off

%% Get the temperature offsets

fc1_init_temp = mean(fc1_temps(1:5));
fc2_init_temp = mean(fc2_temps(1:5));
fc3_init_temp = mean(fc3_temps(1:5));

fc1_temps_offset = fc1_temps + (fc2_init_temp - fc1_init_temp);
fc3_temps_offset = fc3_temps + (fc2_init_temp - fc3_init_temp);


hold on
plot(fc1_temps_offset)
plot(fc2_temps)
plot(fc3_temps_offset)

hold off

%% Save the temperatures
all_temps = [fc1_temps_offset', fc2_temps', fc3_temps_offset'];

csvwrite('temperatures.txt',all_temps);

