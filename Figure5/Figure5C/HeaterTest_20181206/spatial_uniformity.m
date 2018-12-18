%% Get the ranges

x_start = 50000;
x_width = 30000;
y_start = 37000;
y_width = 60000;

%% Create the list of coordinates

x_space = 5000;
y_space = 5000;

x_vals = [x_start:x_space:(x_start+x_width)];

y_vals = y_start:y_space:(y_start + y_width);

[x, y] = meshgrid(x_vals, y_vals);

coords = [x(:), y(:)];

%% Initialize the microscope

import mmcorej.*;
import org.micromanager.MMStudio;
import org.micromanager.api.MultiStagePosition;
import org.micromanager.utils.MDUtils;

% Set Java system properties that tell MM where plugins are located
java.lang.System.setProperty('org.micromanager.plugin.path', 'C:\Program Files\Micro-Manager-1.4/mmplugins');
java.lang.System.setProperty('org.micromanager.autofocus.path', 'C:\Program Files\Micro-Manager-1.4/autofocus');
java.lang.System.setProperty('org.micromanager.beanshell.startup.script', 'C:\Program Files\Micro-Manager-1.4/scripts/mm_beanshell_startup.bsh');

gui = MMStudio(false);
mmc = gui.getCore;

%% Initialize the temp controller
temp_control = OmegaTempController('COM10', false);


%% Loop throught the coordinates randomly

num_coords = length(coords);

coord_indices = randperm(num_coords);

temp = zeros(num_coords, 1);
x_coords = zeros(num_coords, 1);
y_coords = zeros(num_coords, 1);
image_indices = zeros(length(coords), 2);
temp_mat = zeros(length(y_vals), length(x_vals));

for i = 1:length(coords)
    
    % Get the coordinates to move to
    x = coords(coord_indices(i), 1);
    x_coords(i) = x;
    
    y = coords(coord_indices(i), 2);
    y_coords(i) = y;
    
    % Calculate the indices for the image matrixx
    image_indices(i, 1) = ((y - y_start) / y_space) + 1;
    image_indices(i, 2) = ((x - x_start) / x_space) + 1;
    
    % Move to the position
    mmc.setXYPosition("XY Stage", x, y);
    pause(1);
    
    
    % Get the temp
    temp(i) = temp_control.getActualTemperature();
    temp_mat(image_indices(i, 1), image_indices(i,2)) = temp(i);
    disp([i, temp(i)]);
    
end

%% Plot

imagesc(coords(:,1), coords(:,2), temp_mat)
daspect([1 1 1])
