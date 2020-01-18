%% Header

% This function takes an image and filename and creates animations going
% throught the object from 3 different angles, and saves them in the '.gif'
% format in the working directory.

function CreateGif(data, filename)
[m, n, k] = size(data);

% changing data-format to uint8
big = max(max(max(data)));
data = uint8( data .* (255/big) );


%% Top-down
imwrite(data(:,:,1), [filename, 'TD.gif'], 'Loopcount', inf, 'Delaytime', 0.05);
for i= 2:k
    imwrite(data(:,:,i), [filename, 'TD.gif'], 'WriteMode', 'append', 'Delaytime', 0.05);
end

%% Front-back
imwrite(imresize(squeeze(data(1,:,:)), [n,m])', [filename, 'FB.gif'], 'Loopcount', inf, 'Delaytime', 0.05);
for i= 2:m
    imwrite(imresize(squeeze(data(i,:,:)), [n,m])', [filename, 'FB.gif'], 'WriteMode', 'append', 'Delaytime', 0.05);
end

%% Right-Left
imwrite(imresize(squeeze(data(:,1,:)), [n,m])', [filename, 'RL.gif'], 'Loopcount', inf, 'Delaytime', 0.05);
for i= 2:n
    imwrite(imresize(squeeze(data(:,i,:)), [n,m])', [filename, 'RL.gif'], 'WriteMode', 'append', 'Delaytime', 0.05);
end

end

