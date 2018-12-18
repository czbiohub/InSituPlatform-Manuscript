function [time, temp] = getTempSeries(file_name)
    %% Load data
    T = readtable(file_name);

    %% Get times/temps

    temp = T.ProcessValue;

    time = [0:(height(T) - 1)]';

end
