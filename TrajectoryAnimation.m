%{
*Function will dispaly the trajectory and movement
path of the object using a given set of parameters.
*f - Function.
*x - Starting position x.
*t - The current time in the movement cycle.
*v - Velocity of object.
*a - Acceleration of object (Gravity or other).
%}
function [] = TrajectoryAnimation(f,x,t,v,a)
% Will mark the path of the moving object.
object_path = animatedline('Color', 'b', 'Marker','O');
%set(gca,'XLim',[-100 100],'YLim',[-100 100]);
% The Y axis location of the object.
y = f(x);
% Display the current position for this amount of time. 
pause(1)
% Run if the time isn't over.
if (t < 30)
    % Draw the current position.
    addpoints(object_path,x,y);
    drawnow
    % Update the position of the object for the next call.
    % The location increases based on the speed.
    x = x + v;
    % Calculate the new velocty with the given acceleration.
    v = v + a;
    % If the velocity is not positive, the object has stopped moving.
    if (v <=0 )
        return
    end
    % Recursively call the function with updated parameters.
    TrajectoryAnimation(f,x,t+1,v,a)
end
end