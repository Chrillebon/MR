%% Header

% Function used to display slices of the used data. 

% Using doubles assumes data is in image format, using complex values 
% assumes fourier transformed data.


% Example use:
%   disp_slice(my_image_data, [], [], 125);

%% Function
function disp_slice(data, X, Y, Z)

% If only "data" is given
if nargin == 1 % 2D, full image -------------------------------------------
    
    % No complex values
    if real(data) == data
        % Image
        figure;
        imagesc(data);
        colormap('gray');
        colorbar;
    else
        % Fourier-data
        figure;
        imagesc(log(abs(data)));
        colorbar;
    end
        
elseif nargin == 3 % 2D, dimension of slice given -------------------------
    
    % Choosing size of slice
    if isempty(X)
        X = 1:size(data,1);
    elseif strcmpi(X, 'all')
        X = 1:size(data,1);
    end
    if isempty(Y)
        Y = 1:size(data,2);
    elseif strcmpi(Y, 'all')
        Y = 1:size(data,2);
    end
    
    % No complex values
    if real(data) == data
        % Image
        figure;
        imagesc(data(X,Y));
        colormap('gray');
        colorbar;
    else
        % Fourier-data
        figure;
        imagesc(log(abs(data(X,Y))));
        colorbar;
    end
    
else % 3D -----------------------------------------------------------------
    
    % Choosing size of slice
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

    % No complex values
    if real(data) == data
        % Image
        figure;
        imagesc(squeeze(data(X,Y,Z)));
        colormap('gray');
        colorbar;
    else
        % Fourier-data
        figure;
        imagesc(log(abs(squeeze(data(X,Y,Z)))));
        colorbar;
    end

end

end
    