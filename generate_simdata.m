%% Header

% This function is used to create an image with or without texture with
% which the user can test fourier transforming and the capabilities and
% restrictions of the MRI scanner and the data recieved from it.

%% Function
function simData = generate_simdata(K, texFiles)

% Texture files
if nargin == 2
    % Making sure path is correct
    while ~(exist([texFiles, '\tex1.png']) && exist([texFiles, '\tex1.png']) && exist([texFiles, '\tex1.png'])) && ~strcmpi(texFiles, 'Phantom')
        fprintf('Sorry, something went wrong, some or all of the needed textures are not avalible at the path provided.\n');
        fprintf('The files avalible here are: \n     ');
        if ~isempty(dir(texFiles))
            dir(texFiles);
        else
            disp('NONE');
        end
        fprintf('\nThe files needed are "tex1.png", "tex2.png" & "tex3.png"\n\n');
        texFiles = input('Please provide a new path, or type "Phantom":\n');
    end
    
    if ~strcmpi(texFiles, 'Phantom')        
        % Texture values in range [0,1] and size of K*K
        tex1 = imresize(double( imread([texFiles, '\tex1.png']) )./255, [K, K]);
        tex2 = imresize(double( imread([texFiles, '\tex2.png']) )./255, [K, K]);
        tex3 = imresize(double( imread([texFiles, '\tex3.png']) )./255, [K, K]);
    else
        % Phantom image
        simData = phantom(K);
        return;
    end
else
    % If no texture files added
    tex1 = ones(K);
    tex2 = ones(K);
    tex3 = ones(K);    
end

% Size of figures
prop = 1/3;
% Init image
simData = zeros(K);

%% Square

sqSize = floor(K*prop);

% Top left of square
xS = randi(K-sqSize);
yS = randi(K-sqSize);

% Updating image
simData(yS:yS+sqSize-1, xS:xS+sqSize-1) = simData(yS:yS+sqSize-1, xS:xS+sqSize-1) + ...
                                             tex1(yS:yS+sqSize-1, xS:xS+sqSize-1) .* 0.33;

%% Triangle

triSize = floor(K*prop);

% Top left of triangle
xT = randi(K-triSize);
yT = randi(K-triSize);

% Updating image
simData(yT:yT+triSize-1, xT:xT+triSize-1) = simData(yT:yT+triSize-1, xT:xT+triSize-1) + ...
                                          tril(tex2(yT:yT+triSize-1, xT:xT+triSize-1)) .* 0.33;

%% Circle

radius = floor(K*prop/2);

% Center of circle
xC = randi(K-radius*2)+radius;
yC = randi(K-radius*2)+radius;

% Creating coordinates
[a,b] = meshgrid(-radius:radius, -radius:radius);

% Logical array for circle cutout
circle = sqrt(a.^2+b.^2) < radius;

% Updating image
simData(yC-radius:yC+radius, xC-radius:xC+radius) = simData(yC-radius:yC+radius, xC-radius:xC+radius) + ...
                                               circle.*tex3(yC-radius:yC+radius, xC-radius:xC+radius) .* 0.33;

end