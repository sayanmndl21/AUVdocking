classdef auv < handle
    
    properties (SetAccess = public)
        k = 0;
        qn;             % quad number
        time = 0;       % time
        state;          % state
        rot;            % rotation matrix body to world

        color;          % color of quad
        wingspan;       % wingspan
        height;         % height of quad
        motor;          % motor position

        state_hist;     % position history
        time_hist;      % time history
        max_iter;       % max iteration
    end
    
    methods
        function obj = auv(state)
        
    end
    
end