%% Header

% This function is used for figuring out the size of the volume that is
% being worked with. By inputting the volumetric data and the resolution of
% the the scan, the dimensions and volume can be determined.
% Assumes measurements in millimeter [mm]

%% Function
function [V, x,y,z] = vol_size(data, x_size, y_size, z_size)

if nargin == 2
    y_size = x_size;
    z_size = x_size;
end

% Sum of all values
tot = sum(sum(sum(data)));

%% Width of figure

i = 1;
% continue till significant slice found
while sum(sum(data(i,:,:))) < 0.001*tot
    i = i+1;
end
o = size(data,1);
% continue till significant slice found, from back
while sum(sum(data(o,:,:))) < 0.001*tot
    o = o-1;
end
% Width is difference
x = (o-i) * x_size;

%% Length of figure

i = 1;
% continue till significant slice found
while sum(sum(data(:,i,:))) < 0.001*tot
    i = i+1;
end
o = size(data,2);
% continue till significant slice found, from back
while sum(sum(data(:,o,:))) < 0.001*tot
    o = o-1;
end
% Length is difference
y = (o-i) * y_size;

%% Height of figure

i = 1;
% continue till significant slice found
while sum(sum(data(:,:,i))) < 0.001*tot
    i = i+1;
end
o = size(data,3);
% continue till significant slice found, from back
while sum(sum(data(:,:,o))) < 0.001*tot
    o = o-1;
end
% Height is difference
z = (o-i) * z_size;

%% Volume of figure

% Cubic millimeters [mm^3]
V = x*y*z;

end

