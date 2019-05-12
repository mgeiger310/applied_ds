%% Lacrosse Shot Chart Data Entry
% By Robert Treiber III

%% INITIALIZING/ SETTING UP PROGRAM
clear all

field_zones = imread('field_location.png');
field = imread('Lacrossefield.png');
figure
imshow(field)
hold on

% WELCOME BOX
type = questdlg('Welcome to the data entry function', ...
	'Data Entry', 'Begin', 'extra');


%% GAME NUMBER & NUMBER OF SHOTS 
prompt = {'Opponent Number: ', 'Number of Shots: '};
title1 = 'STEP 1 OF 4';

type = inputdlg(prompt,title1);
    game.opp_num = str2double(type{1});
    total_shots = str2double(type{2});


%% SHOT INPUT (DATA ENTRY FUNCTION)
[shot_x_loc, shot_y_loc, shot_goal, shot_save] = shot_input(total_shots);

%% SAVE GAME DATA

save('example')


%% PRINTS ALL SHOTS FROM GAME

print_chart(shot_x_loc,shot_y_loc,shot_goal,shot_save,total_shots)

