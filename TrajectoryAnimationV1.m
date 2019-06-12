%{
    OLD VERSION -- USE NEW VERSION PLEASE.
%}
function [] = TrajectoryAnimationV1(pos,vel,accel,r,t)
    % Use a grid for better appearance while running. 
    grid on
    % Set the graph to follow the object closely.
    %check this command later
    set(gca,'XLim',[pos(1)-50 pos(1)+50],'YLim',[pos(2)-50 pos(2)+50]);
    dt = 1;
    % Create the object we will see moving.
    object = rectangle('Position',[pos(1)-r/2,pos(2)-r/2,r,r],'FaceColor','red','EdgeColor','black', 'Curvature',[1 1]);
    % Leave a trail of circles to mark the visited locations.
    object_path = animatedline('Color', 'r', 'Marker','O');
    % Pause for 3 seconds to clearly see the current location.
    pause(3);
    % Remove old object created in previous recursive call.
    delete(object);
    % Trail the object for 30 seconds.
    if (t < 30)
        % Increase the time.
        t = t + dt;
        % Calculate the veloctiy.
        vel(2) = vel(2) + (accel * dt);
        vel(1)= vel(1)+(accel*dt);
         % Calculate the new position.
        new_pos = pos + (vel * dt);
        % Mark previously visited location and draw.
        addpoints(object_path,pos(1) - r/2,pos(2) - r/2);
        drawnow
        % Recursively call with new velocity and position.
        TrajectoryAnimationV1(new_pos,vel,accel,r,t);
    end
end
