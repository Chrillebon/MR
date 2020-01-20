%% Header

% This function is used to take a stack of images and convert it into and
% showing a volume of the item at hand
% Tries to estimate what in the picture is a brain, and what should be left
% out and from there creates the volume. If faulty, uncomment one of the
% last lines letting the user input the value from the histogram to keep.

%% Function
function vol = create_vol(data, X, Y, Z)

% Ease of use
if nargin == 1
    X = 1:size(data,1);
    Y = 1:size(data,2);
    Z = 1:size(data,3);
else
    if isempty(X)
        X = 1:size(data,1);
    end
    if isempty(Y)
        Y = 1:size(data,2);
    end
    if isempty(Z)
        Z = 1:size(data,3);
    end
end

% Creating and showing histogram
figure;
h = histogram(data(1:size(data,1),1:size(data,2),1:size(data,3)),50);

% leftmost value, rightmost values saved
groups = [0,0];
tot = sum(h.Values);

% Finds average of histogram of reasonable values
% Uses af cutoff to group intervals together
group_cut = mean(h.Values(h.Values < tot*0.1 & h.Values > tot*0.0001));

% Goes through values in histogram
i = 1;
while i <= length(h.Values)
    width = 0;
    % Within size that can be a group
    while(h.Values(i) > group_cut)
        width = width+1;
        i = i+1;
    end
    
    % If it found a group
    if width
        groups = [groups, i-width, i];
    end
    i = i+1;
end

% Over this value is brain
boundry = (groups(length(groups)-1)-1) * h.BinWidth;
        
% User input, if ever needed
if boundry == 0
    boundry = input('Auto-detection of volume failed.\n\nPlease enter the value minimum value of the color to create volume from: ');
end
    
% Creating logical volume
vol = data(X,Y,Z) > boundry;

% Showing volume
figure;
volshow(smooth3(vol));

end