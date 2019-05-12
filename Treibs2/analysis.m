%% IDENTIFY CENTER OF NET

net_pic = imread('net.jpg');
h=msgbox('Click the center of the net','Net ID','custom',net_pic);
pause(4)
if exist('h', 'var')
  delete(h);
  clear('h');
end

[x y] = ginput(1);
net_location.x = x;
net_location.y = y;

%% IDENTIFY KNOWN DISTANCE

rest_pic = imread('restraining_line.png');
h=msgbox('Click on the RESTRAINING LINE','Box ID','custom',rest_pic);
pause(4)
if exist('h', 'var')
  delete(h);
  clear('h');
end

[x y] = ginput(1);
net_location.x = x;
net_location.y = y;

%% DIST CALCULATIONS

px_dist = net_location.y - ref.y;
real_dist = 20;
px_per_yrd = px_dist/real_dist;

[imx,imy] = size(field);

