%% Header

% Function used to display slices of the used data. 

% Using doubles assumes data is in image format, using complex values 
% assumes fourier transformed data.


% Example use:
%   disp_slice(my_image_data, [], [], 125);

%% Function
function disp_slice(data, X, Y, Z)

if nargin == 1 % 2D, full image -------------------------------------------
    
    if real(data) == data
        % Image
        figure;
        imagesc(data);
        colormap('gray');
        colorbar;
    else
        % Fourier-data
        figure;
        imagesc(log(abs(fftshift(data))));
        colorbar;
    end
        
elseif nargin == 3 % 2D, some of the image --------------------------------
    
    % Choosing the correct slice
    if isempty(X)
        X = 1:size(data,2);
    elseif strcmpi(X, 'all')
        X = 1:size(data,2);
    end
    if isempty(Y)
        Y = 1:size(data,1);
    elseif strcmpi(Y, 'all')
        Y = 1:size(data,1);
    end
    
    if real(data) == data
        % Image
        figure;
        imagesc(data(Y,X));
        colormap('gray');
        colorbar;
    else
        % Fourier-data
        figure;
        imagesc(log(abs(fftshift(data(Y,X)))));
        colorbar;
    end
    
else % 3D -----------------------------------------------------------------
    
    % Choosing the correct slice
    if isempty(X)
        X = 1:size(data,2);
    elseif strcmpi(X, 'all')
        X = 1:size(data,2);
    end
    if isempty(Y)
        Y = 1:size(data,1);
    elseif strcmpi(Y, 'all')
        Y = 1:size(data,1);
    end
    if isempty(Z)
        Z = 1:size(data,3);
    elseif strcmpi(Z, 'all')
        Z = 1:size(data,3);
    end


    if real(data) == data
        % Image
        figure;
        imagesc(data(Y,X,Z));
        colormap('gray');
        colorbar;
    else
        % Fourier-data
        figure;
        imagesc(log(abs(fftshift(data(Y,X,Z)))));
        colorbar;
    end

end

end
    