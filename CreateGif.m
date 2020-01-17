function CreateGif(file, filename)
[m, n, k] = size(file);

big = max(max(max(file)));
file = uint8(file.*(255/big));
%imagesc(file(:,:,1));
%% Top-down
imwrite(file(:,:,1), [filename, 'TD.gif'], 'Loopcount', inf, 'Delaytime', 0.1);
for i= 2:k
imwrite(file(:,:,i), [filename, 'TD.gif'], 'WriteMode', 'append', 'Delaytime', 0.1);
end

%% Front-back
imwrite(imresize(squeeze(file(1,:,:)), [n,m])', [filename, 'FB.gif'], 'Loopcount', inf, 'Delaytime', 0.1);
for i= 2:m
imwrite(imresize(squeeze(file(i,:,:)), [n,m])', [filename, 'FB.gif'], 'WriteMode', 'append', 'Delaytime', 0.1);
end

%% Right-Left
imwrite(imresize(squeeze(file(:,1,:)), [n,m])', [filename, 'RL.gif'], 'Loopcount', inf, 'Delaytime', 0.1);
for i= 2:n
imwrite(imresize(squeeze(file(:,i,:)), [n,m])', [filename, 'RL.gif'], 'WriteMode', 'append', 'Delaytime', 0.1);
end
end

