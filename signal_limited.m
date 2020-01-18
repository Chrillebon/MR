%% Header

% This function takes the fourier transformed data and places padding, the
% value '0', at the "least significant" portion of the picture, 
% effectively reducing the accuracy of the image, keeping only the sharp
% boundries of the image (removing the softer transitions).
% Keeping only frac of the image.

% WARNING: Multi-slice limiting is still a work in progress!!!

%% Function
function signal_pad = signal_limited(signal, frac)

% Percent to range [0,1]
if frac > 1 && frac <= 100
    frac = frac / 100;
end

% Shifting important info to center
signal_pad = fftshift(signal);

width = size(signal,2);
height = size(signal,1);
border_size = floor(size(signal,1)*(0.5-frac/2));

% For all slices of data
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

% Back to original
signal_pad = ifftshift(signal_pad);

end
