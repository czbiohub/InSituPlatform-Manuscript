function S = analyzeTempSeries(file_name, t_eq)
    %% Load data
    T = readtable(file_name);

    %% Get times/temps

    temp = T.ProcessValue;

    time = [0:(height(T) - 1)]';
    
    %% Calculate step resposne
    S = stepinfo(temp, time, t_eq);
    
    
    % Plot the response
    plot(time, temp);
    xlabel('Time [s]');
    ylabel('Temp [deg C]');

end
