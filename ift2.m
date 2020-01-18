%% Header

% This function inverse fourier transforms an image and makes sure that the 
% format conforms with the dimensions that is required for further use of 
% images in this program.

%% Function

function imData = ift2(data)

% Size check
if ~(length(size(data)) == 3 || length(size(data)) == 2)
    fprintf('The dimensions of the data must be 2 or 3\nNo action taken.\n');
    imData = data;
    return;
end

imData = abs(ifft2(data));

end