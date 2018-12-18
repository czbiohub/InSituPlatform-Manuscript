%% Make obj

t = TCreader('COM7', 'Uno', false);

%% Record temps
temp_index = 1;
temps = [];


for i = 1:540
    disp(i);
    for pin = 0:2
        
        try
            temps(temp_index) = t.getTemp(pin);
        
            temp_index = temp_index + 1;
            
        catch
            disp('oops');
            
        end
            
    end
    
    
    pause(5);
end