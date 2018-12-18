classdef TCreader < handle
    
   properties (Access = private)
        ard
        virtual = false;
        com_port = '';
        board = '';

   end
    
   methods (Access= public)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Constructor
        function this = TCreader(com_port, board, virtual)
            
            if ~exist('virtual', 'var')
                virtual = false;
            end
            
            % Save properties
            this.com_port = com_port;
            this.board = board;
            this.virtual = virtual;
            
            if ~virtual
                this.open();

            else
                this.com_port = 'Virtual';
                
            end
            
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function temp = getTemp(this, port)
            
            if ~this.virtual
                pin = strcat('A', num2str(port));
                
                voltage = this.ard.readVoltage(pin);

                temp = this.convertTemp(voltage);
                
            else
                
                temp = 100 * rand;
                
            end
            
        end
        
        
   end
   
   methods (Access = private)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Open communication
        function open(this)
            
            if isempty(this.ard)
                try
                    this.ard = arduino(this.com_port, this.board);

                catch ME

                    
                end
            end
        end %open
        
        function temp = convertTemp(this, voltage)
            % from https://www.adafruit.com/product/1778?gclid=EAIaIQobChMIlImE5JCg3wIVSrnACh0v5QMtEAQYASABEgJnWvD_BwE
            
            temp = (voltage - 1.25) / 0.005;
            
            
        end
        
   end
    
    
end