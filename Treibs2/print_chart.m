function print_chart(shot_x_loc,shot_y_loc,shot_goal,shot_save,total_shots)
% print_chart(shot_x_loc,shot_y_loc,shot_goal,shot_save,total_shots)
% This function prints each shot on the field and tallies the total of
% goals, misses, and saves which is displayed for the user

field = imread('Lacrossefield.png');
goals = 0;
saves = 0;
misses = 0;

figure
imshow(field)
title('Final Chart')
hold on

for i = 1:total_shots
    if shot_goal(i) == 1 && shot_save(i) == 0
        scatter(shot_x_loc(i), shot_y_loc(i), 50, 'red', 'x')
        hold on
        goals = goals+1;
    elseif shot_goal(i) == 0 && shot_save(i) == 1
        scatter(shot_x_loc(i), shot_y_loc(i), 75, 'green', 'o')
        hold on
        saves = saves+1;
    else
        scatter(shot_x_loc(i), shot_y_loc(i), 50, 'black', '*')
        hold on
        misses = misses+1;
    end
end

helpdlg(sprintf('goals = %d  |  saves = %d  |  misses = %d', goals, saves, misses))
