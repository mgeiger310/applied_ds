%% DATA COMPOSITION AND ANALYSIS
% By Robert Treiber III


%% Compile Games
clear all

all_shots = 0;

Games = {'game3.mat','game4.mat','game5.mat','game6.mat','game7.mat', ...
    'game8.mat','game9.mat','game10.mat','game11.mat','game12.mat', ...
    'game13.mat','game14.mat','game15.mat','game16.mat','game17','game18'};

for i = 1:length(Games)
    load(string(Games(i)))
    
    for j = 1:total_shots
        all_shot_goal(all_shots+j) = shot_goal(j);
        all_shot_save(all_shots+j) = shot_save(j);
        all_shot_x_loc(all_shots+j) = shot_x_loc(j);
        all_shot_y_loc(all_shots+j) = shot_y_loc(j);
    end
    
    all_shots = all_shots + total_shots;
end

%% PRINT

print_chart(all_shot_x_loc,all_shot_y_loc,all_shot_goal,all_shot_save,all_shots)

%% IDENTIFY CENTER OF NET

crosshair = imread('net.jpg');
h=msgbox('Click the center of the net','Net ID','custom',crosshair);
pause(4)
if exist('h', 'var')
  delete(h);
  clear('h');
end

[x y] = ginput(1);
net_location.x = x;
net_location.y = y;

%% IDENTIFY KNOWN DISTANCE

crosshair = imread('restraining_line.jpg');
h=msgbox('Click on the RESTRAINING LINE','Box ID','custom',crosshair);
pause(4)
if exist('h', 'var')
  delete(h);
  clear('h');
end

[x y] = ginput(1);
ref.x = x;
ref.y = y;

%% DIST CALCULATIONS

px_dist = net_location.y - ref.y;
real_dist = 20;
px_per_yrd = px_dist/real_dist;

[imx,imy] = size(field);

for i = 1:length(all_shot_x_loc)
    pix_dist(i) = sqrt((net_location.x - all_shot_x_loc(i))^2 + ...
        (net_location.y - all_shot_y_loc(i))^2);
    
    dist(i) = pix_dist(i)/px_per_yrd;
end

%% ORGANIZING SHOTS BY FIELD LOCATION

left_side = zeros(1,length(all_shot_x_loc));
left_mid = zeros(1,length(all_shot_x_loc));
right_mid = zeros(1,length(all_shot_x_loc));
right_side = zeros(1,length(all_shot_x_loc));

for i = 1:all_shots
    if (net_location.y - all_shot_y_loc(i)) < -(all_shot_x_loc(i) - net_location.x)
        left_side(i) = 1;
    elseif (net_location.y - all_shot_y_loc(i)) < (all_shot_x_loc(i) - net_location.x)
        right_side(i) = 1;
    elseif all_shot_x_loc(i) < net_location.x
        left_mid(i) = 1;
    elseif all_shot_x_loc(i) > net_location.x
        right_mid(i) = 1;
    end
end

%% ORGANIZING SHOTS BY FIELD LOCATION & DISTANCE FROM NET

ls_goals = 0; ls_saves = 0; ls_misses = 0;
ls_close_goal = 0; ls_mid_goal = 0; ls_long_goal = 0;
ls_close_save = 0; ls_mid_save = 0; ls_long_save = 0;
ls_close_miss = 0; ls_mid_miss = 0; ls_long_miss = 0;

rs_goals = 0; rs_saves = 0; rs_misses = 0;
rs_close_goal = 0; rs_mid_goal = 0; rs_long_goal = 0;
rs_close_save = 0; rs_mid_save = 0; rs_long_save = 0;
rs_close_miss = 0; rs_mid_miss = 0; rs_long_miss = 0;

lm_goals = 0; lm_saves = 0; lm_misses = 0;
lm_close_goal = 0; lm_mid_goal = 0; lm_long_goal = 0;
lm_close_save = 0; lm_mid_save = 0; lm_long_save = 0;
lm_close_miss = 0; lm_mid_miss = 0; lm_long_miss = 0;

rm_goals = 0; rm_saves = 0; rm_misses = 0;
rm_close_goal = 0; rm_mid_goal = 0; rm_long_goal = 0;
rm_close_save = 0; rm_mid_save = 0; rm_long_save = 0;
rm_close_miss = 0; rm_mid_miss = 0; rm_long_miss = 0;

for i = 1:all_shots
    if left_side(i) == 1
        if all_shot_goal(i) == 1
            ls_goals = ls_goals + 1;
            if dist(i) < 6
                ls_close_goal = ls_close_goal + 1;
            elseif dist(i) < 12
                ls_mid_goal = ls_mid_goal + 1;
            else
                ls_long_goal = ls_long_goal + 1;
            end
        elseif all_shot_save(i) == 1
            ls_saves = ls_saves + 1;
            if dist(i) < 6
                ls_close_save = ls_close_save + 1;
            elseif dist(i) < 12
                ls_mid_save = ls_mid_save + 1;
            else
                ls_long_save = ls_long_save + 1;
            end
        else
            ls_misses = ls_misses + 1;
            if dist(i) < 6
                ls_close_miss = ls_close_miss + 1;
            elseif dist(i) < 12
                ls_mid_miss = ls_mid_miss + 1;
            else
                ls_long_miss = ls_long_miss + 1;
            end
        end
    elseif right_side(i) == 1
        if all_shot_goal(i) == 1
            rs_goals = rs_goals + 1;
            if dist(i) < 6
                rs_close_goal = rs_close_goal + 1;
            elseif dist(i) < 12
                rs_mid_goal = rs_mid_goal + 1;
            else
                rs_long_goal = rs_long_goal + 1;
            end
        elseif all_shot_save(i) == 1
            rs_saves = rs_saves + 1;
            if dist(i) < 6
                rs_close_save = rs_close_save + 1;
            elseif dist(i) < 12
                rs_mid_save = rs_mid_save + 1;
            else
                rs_long_save = rs_long_save + 1;
            end
        else
            rs_misses = rs_misses + 1;
            if dist(i) < 6
                rs_close_miss = rs_close_miss + 1;
            elseif dist(i) < 12
                rs_mid_miss = rs_mid_miss + 1;
            else
                rs_long_miss = rs_long_miss + 1;
            end
        end
    elseif left_mid(i) == 1
        if all_shot_goal(i) == 1
            lm_goals = lm_goals + 1;
            if dist(i) < 6
                lm_close_goal = lm_close_goal + 1;
            elseif dist(i) < 12
                lm_mid_goal = lm_mid_goal + 1;
            else
                lm_long_goal = lm_long_goal + 1;
            end
        elseif all_shot_save(i) == 1
            lm_saves = lm_saves + 1;
            if dist(i) < 6
                lm_close_save = lm_close_save + 1;
            elseif dist(i) < 12
                lm_mid_save = lm_mid_save + 1;
            else
                lm_long_save = lm_long_save + 1;
            end
        else
            lm_misses = lm_misses + 1;
            if dist(i) < 6
                lm_close_miss = lm_close_miss + 1;
            elseif dist(i) < 12
                lm_mid_miss = lm_mid_miss + 1;
            else
                lm_long_miss = lm_long_miss + 1;
            end
        end
    elseif right_mid(i) == 1
        if all_shot_goal(i) == 1
            rm_goals = rm_goals + 1;
            if dist(i) < 6
                rm_close_goal = rm_close_goal + 1;
            elseif dist(i) < 12
                rm_mid_goal = rm_mid_goal + 1;
            else
                rm_long_goal = rm_long_goal + 1;
            end
        elseif all_shot_save(i) == 1
            rm_saves = rm_saves + 1;
            if dist(i) < 6
                rm_close_save = rm_close_save + 1;
            elseif dist(i) < 12
                rm_mid_save = rm_mid_save + 1;
            else
                rm_long_save = rm_long_save + 1;
            end
        else
            rm_misses = rm_misses + 1;
            if dist(i) < 6
                rm_close_miss = rm_close_miss + 1;
            elseif dist(i) < 12
                rm_mid_miss = rm_mid_miss + 1;
            else
                rm_long_miss = rm_long_miss + 1;
            end
        end
    end
end

percent_left_side_goals = ls_goals / nnz(left_side);
percent_left_side_saves = ls_saves / nnz(left_side);
percent_right_side_goals = rs_goals / nnz(right_side);
percent_right_side_saves = rs_saves / nnz(right_side);
percent_left_mid_goals = lm_goals / nnz(left_mid);
percent_left_mid_saves = lm_saves / nnz(left_mid);
percent_right_mid_goals = rm_goals / nnz(right_mid);
percent_right_mid_saves = rm_saves / nnz(right_mid);

%% SAVE PERCENTAGES BY LOCATION AND DISTANCE

save_percentage_left_side = ls_saves / (ls_saves+ls_goals);
save_percent_ls_close = ls_close_save / (ls_close_save+ls_close_goal);
save_percent_ls_mid = ls_mid_save / (ls_mid_save+ls_mid_goal);
save_percent_ls_long = ls_long_save / (ls_long_save+ls_long_goal);

save_percentage_right_side = rs_saves / (rs_saves + rs_goals);
save_percent_rs_close = rs_close_save / (rs_close_save+rs_close_goal);
save_percent_rs_mid = rs_mid_save / (rs_mid_save+rs_mid_goal);
save_percent_rs_long = rs_long_save / (rs_long_save+rs_long_goal);

save_percentage_left_mid = lm_saves / (lm_saves+lm_goals);
save_percent_lm_close = lm_close_save / (lm_close_save+lm_close_goal);
save_percent_lm_mid = lm_mid_save / (lm_mid_save+lm_mid_goal);
save_percent_lm_long = lm_long_save / (lm_long_save+lm_long_goal);

save_percentage_right_mid = rm_saves / (rm_saves + rm_goals);
save_percent_rm_close = rm_close_save / (rm_close_save+rm_close_goal);
save_percent_rm_mid = rm_mid_save / (rm_mid_save+rm_mid_goal);
save_percent_rm_long = rm_long_save / (rm_long_save+rm_long_goal);


%% HEAT MAP

save_perc = [save_percent_ls_long, save_percent_lm_long, save_percent_rm_long, save_percent_rs_long; ...
    save_percent_ls_mid, save_percent_lm_mid, save_percent_rm_mid, save_percent_rs_mid; ...
    save_percent_ls_close, save_percent_lm_close, save_percent_rm_close, save_percent_rs_close];

location = {'Side Left', 'Middle Left', 'Middle Right', 'Side Right'};
distances = {'Long', 'Mid', 'Close'};

figure
h = heatmap(location, distances, save_perc)

h.Title = 'Save Percentage by Location vs Distance';
h.XLabel = 'Location';
h.YLabel = 'Distance';

%% CLEANING DATA FOR MACHINE LEARNING

for i = 1:all_shots
    if all_shot_goal(i) == 1 && all_shot_save(i) == 0
        shot_type(i) = -1;
        all_shot_miss_or_save(i) = 0;
    elseif all_shot_goal(i) == 0 && all_shot_save(i) == 1
        shot_type(i) = 1;
        all_shot_miss_or_save(i) = 1;
    else
        shot_type(i) = 0;
        all_shot_miss_or_save(i) = 1;
    end
end

data_table = table(shot_type', all_shot_x_loc', all_shot_y_loc', dist');

data_table_NEW = table(all_shot_miss_or_save', all_shot_save', all_shot_goal', all_shot_x_loc', all_shot_y_loc', dist');

