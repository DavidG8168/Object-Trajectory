%{
Display the trajectory of an object falling for 15 seconds,
we chose to use 15 seconds as larger times seem to long.
First we will trail the object closely by drawing
the object and it's train each iteration, and after that
we will show the entire path using the comet function.
** VARIABLES **
pos -> [x y] starting position.
path -> [] empty vector to store position points.
vel -> [vx vy] velocity.
accel -> an integer, usually gravity.
r -> radius of ball, recommend 5.
t -> starting time, should be 0.
%}
function [] = TrajectoryAnimation(pos,path,vel,accel,r,t)
    % Append the points to the path vector.
    path = [path pos];
    % Set the graph to follow the object closely.
    set(gca,'XLim',[pos(1)-100 pos(1)+100],'YLim',[pos(2)-100 pos(2)+100]);
    % The time difference will be 1/24 as discussed to show a
    % realistic animation.
    dt = 1/24;
    % Create the object we will see moving.
    object = rectangle('Position',[pos(1)-r,pos(2)-r,r,r],'FaceColor','blue','EdgeColor','black','Curvature',[1 1]);
    % Leave a trail of circles to mark the visited locations.
    object_path = animatedline('Color', 'blue', 'Marker','O');
    % Pause for 1/24 seconds to clearly see the current location
    % and create a good animation sequence.
    pause(1/24);
    % Remove old object created in previous recursive call.
    delete(object);
    % Trail the object for 30*24 frames, approximately 30 seconds.
    if (t < 15)
        % Change the time.
        t = t + dt;
        % Calculate the new position.
        % x axis moves by vx velocity.
        new_pos(1) = pos(1) + vel(1)*dt;
        % y axis moves by vy velocity.
        new_pos(2) = pos(2) - (vel(2) * dt);
        % Calculate the new veloctiy.
        % vx.
        vel(1) = vel(1);
        % vy.
        vel(2) = vel(2) + (accel * dt);
        % Mark previously visited location and draw it.
        addpoints(object_path,pos(1) - r/2,pos(2) - r/2);
        drawnow
        % Recursively call with new velocity and position.
        TrajectoryAnimation(new_pos,path,vel,accel,r,t);
    end
    % Split the path vector to x points and y points.
    x_points = path(1:2:end);
    y_points = path(2:2:end);
    % Create a comet animation to display the FULL path of the object.
    comet(x_points,y_points);
end