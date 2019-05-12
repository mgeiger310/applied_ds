function [shot_x_loc, shot_y_loc, shot_goal, shot_save] = shot_input(total_shots)
% [shot_x_loc, shot_y_loc, shot_goal, shot_save] = shot_input(total_shots)
% This function takes in a user click as the shot location then prompts
% the user for the type of shot (goal, save, or missed net)

for i = 1:total_shots
%% IDENTIFY SHOT LOCATION
    
    crosshair = imread('crosshair.jpg');
    h=msgbox('Click the shot location','STEP 3 OF 4','custom',crosshair);
    
    if i < 2
        pause(3)
        if exist('h', 'var')
            delete(h);
            clear('h');
        end
    else
        pause(1)
        if exist('h', 'var')
            delete(h);
            clear('h');
        end
    end
    
    [x y] = ginput(1);
    shot_x_loc(i) = x;
    shot_y_loc(i) = y;
    
%% IDENTIFY SHOT TYPE
    
    shot_type = questdlg('Shot Type', ...
        'Shot Type', ...
        'Miss','Goal','Save','extra');
    % Handle response
    if shot_type == 'Miss'
        shot_goal(i) = 0;
        shot_save(i) = 0;
        scatter(shot_x_loc(i), shot_y_loc(i), 50, 'black', '*')
        hold on
    elseif shot_type == 'Goal'
        shot_goal(i) = 1;
        shot_save(i) = 0;
        scatter(shot_x_loc(i), shot_y_loc(i), 50, 'red', 'x')
        hold on
    elseif shot_type == 'Save'
        shot_goal(i) = 0;
        shot_save(i) = 1;
        scatter(shot_x_loc(i), shot_y_loc(i), 75, 'green', 'o')
        hold on
    end
end

end