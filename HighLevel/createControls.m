function Con = createControls(Robot)

% CREATECONTROLS  Create controls structure Con.
%   Con = CREATECONTROLS(ROBOT) generates an array of control structures
%   Con, the same size of ROBOTS. This structure depends on the motion
%   models of each robot, and contains the fields:
%       .u      nominal value of control
%       .uStd   Standard deviation of control noise
%       .U      Covariances matrix
%
%   The resulting structure need to be updated during execution time with
%   data from one of these origins: 
%       1. read from odometry sensors
%       2. generated by a control software
%       3. generated by the simulator.
%
%   See also CREATEROBOTS.

for rob = 1:numel(Robot)
    
    Con(rob).robot = Robot{rob}.id;
    
    switch Robot{rob}.motion
        
        case {'constVel','odometry'}
            
            Con(rob).u    = zeros(6,1);
            Con(rob).uStd = zeros(6,1);
            Con(rob).U    = zeros(6,6);
                        
        otherwise
            error('Unknown motion model %s from robot %d.',Robot{rob}.motion,Robot{rob}.id);
    end
end