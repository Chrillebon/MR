%% Header

% This function takes the fourier transformed data and places padding, the
% value '0', at the "least significant" portion of the picture (the edges), 
% effectively reducing the accuracy of the image, keeping only the plane
% surfaces of the image to keep the ability to categorize the different
% parts of the brain.
% Keeping only frac of the image.
% Only works on square images

%% Function
function signal_pad = signal_limited(signal, frac)

% Percent to range [0,1]
if frac > 1 && frac <= 100
    frac = frac / 100;
end

% Init
signal_pad = signal;
% Assumes square picture
width = size(signal,1);
height = width;

% Keeping "frac" of the image
border_size = floor(width*(0.5-frac/2));

% For all slices of data
% Adds borders of '0'
for i=1:size(signal,3)
    % Top
    signal_pad(1:border_size,:,i) = 0;
    % Bottom
    signal_pad(height-border_size+1:height,:,i) = 0;
    % Left
    signal_pad(:,1:border_size,i) = 0;
    % Right
    signal_pad(:,width-border_size+1:width,i) = 0;
end

end
