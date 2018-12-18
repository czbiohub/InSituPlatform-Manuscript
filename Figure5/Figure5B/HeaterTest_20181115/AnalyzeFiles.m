%% 40 deg C on stand
% Steady state at 40 deg C. in a thin polymer Ibidi flow cell
% on the test stand
%
[time, temp] = getTempSeries('40_degC_PID_autotune_in_flowcell.csv');

temp_mean = mean(temp);
temp_std = std(temp);

cv = temp_std / temp_mean

plot(time, temp)
xlabel('Time [s]');
ylabel('Temp [deg. C]');


%% 40 deg C on stand
% Ramp from room temperature to 40 deg C. with the flow cell 
% on the test stand

analyzeTempSeries('40_degC_PID_autotune_in_channel_output2.csv', 40)

[time, temp] = getTempSeries('40_degC_PID_autotune_in_channel_output2.csv');

temp_mean = mean(temp(60:length(temp)));
temp_std = std(temp(60:length(temp)));

cv = temp_std / temp_mean
%% 40 deg C on stage
% Ramp from room temperature to 40 deg C. with the flow cell 
% on the InSituScope stage

analyzeTempSeries('40degC_in_channel.csv', 40)

[time, temp] = getTempSeries('40degC_in_channel.csv');

temp_mean = mean(temp(60:length(temp)));
temp_std = std(temp(60:length(temp)));

cv = temp_std / temp_mean


%% 60 deg C on stage
% Ramp from room temperature to 60 deg C. with the flow cell 
% on the microscope stage

analyzeTempSeries('60degC_onstage_in_channel.csv', 60)

[time, temp] = getTempSeries('60degC_onstage_in_channel.csv');

temp_mean = mean(temp(155:length(temp)));
temp_std = std(temp(155:length(temp)));

cv = temp_std / temp_mean

%% 60 deg C w/ showerhead

files = ["60degC_showerhead_tune.csv", "60degC_showerhead_tune2.csv",...
    "60degC_showerhead_tune3.csv", "60degC_showerhead_tune4.csv",...
    "60degC_showerhead_tune5.csv"];

rise_times = zeros(length(files), 1);
settling_times = zeros(length(files), 1);
overshoots = zeros(length(files), 1);
steady_state_means = zeros(length(files), 1);
steady_state_stds = zeros(length(files), 1);

% for i = 1:length(files)
%     
%     S = analyzeTempSeries(files(i), 60);
%     
%     rise_times(i) = S.RiseTime;
%     settling_times(i) = S.SettlingTime;
%     overshoots(i) = S.Overshoot;
%     
% end


hold on

figure(2)
for i = 1:length(files)
   
    [time, temp] = getTempSeries(files(i));
    
    S = stepinfo(temp(1:200), time(1:200), 60);
    
    rise_times(i) = S.RiseTime;
    settling_times(i) = S.SettlingTime;
    overshoots(i) = S.Overshoot;
    
    steady_state_means(i) = mean(temp(125:300));
    steady_state_stds(i) = std(temp(125:300));
    
    plot(time, temp);
    xlabel('Time [s]');
    ylabel('Temp [deg C]');
    
    
end


rise_times_mean = mean(rise_times)
rise_times_std = std(rise_times)
rise_times_cv = rise_times_std / rise_times_mean

settling_times_mean = mean(settling_times)
settling_times_std = std(settling_times)
settling_times_cv = settling_times_std / settling_times_mean

overshoots_mean = mean(overshoots)
overshoots_std = std(overshoots)
overshoots_cv = overshoots_std / overshoots_mean

steady_state_means_mean = mean(steady_state_means)
steady_state_means_std = std(steady_state_means)
steady_state_means_cv = steady_state_means_std / steady_state_means_mean

steady_state_stds_mean = mean(steady_state_stds)
steady_state_stds_std = std(steady_state_stds)
steady_state_stds_cv = steady_state_stds / steady_state_stds

