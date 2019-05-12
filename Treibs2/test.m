
clear all

%% Print Bowdoin Game
figure
imshow('Lacrossefield.png')
title('Game 15')
hold on
%load('game17.mat')



goals = 0;
saves = 0;
misses = 0;


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

%% Print Amherst Game
figure
imshow('Lacrossefield.png')
title('Game 12')
hold on
load('Amherst.mat')


goals = 0;
saves = 0;
misses = 0;


for i = 1:total_shots
    if shot_goal(i) == 1 && shot_save(i) == 0
        scatter(shot_x_loc(i), shot_y_loc(i), 75, 'red', 'x')
        hold on
        goals = goals+1;
    elseif shot_goal(i) == 0 && shot_save(i) == 1
        scatter(shot_x_loc(i), shot_y_loc(i), 100, 'black', 'o')
        hold on
        saves = saves+1;
    else
        scatter(shot_x_loc(i), shot_y_loc(i), 30, 'blue', '*')
        hold on
        misses = misses+1;
    end
end

helpdlg(sprintf('goals = %d  |  saves = %d  |  misses = %d', goals, saves, misses))

%% Print Middlebury Game

figure
imshow('Lacrossefield.png')
title('Game 14')
hold on
load('Middlebury.mat')


goals = 0;
saves = 0;
misses = 0;


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
