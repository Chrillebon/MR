%% Header

% This function creates a graph over how the error in recreating images
% changes with added noise and changing padding. The two first arrays
% changes the values of noise and padding used to create the graph. They
% should be given in range [0,1].
% "simData" is an image that we DFT tranform to know how the recreation
% should be.

%% Function
function graph=graphing_error(noise_array,pad_array,simData)
figure(); hold on

% Text for naming and displaying different noise levels
text=strsplit(num2str(noise_array*100));

% DFT transform original image
sim_fourier = ft2(simData);

% One line for every level of noise
for i=1:length(noise_array)
    
    % Adds noise
    im_noisy = addnoise(sim_fourier, noise_array(i));
    
    % Goes through all levels of padding
    for k=1:length(pad_array)
        signal_pad = signal_limited(im_noisy, pad_array(k));
        
        % Recreates the picture
        inv_fourier = ift2(signal_pad);
        
        % Calculate error
        Error(k)=error_measure(simData,inv_fourier);
    end
   
    % Add to graph
    graph=plot(pad_array,Error);
    xlabel('Fraction of image made visible');
    ylabel('Error');

end

% Add text
lgd=legend({text{1:length(text)}},'Location','north');
title(lgd,'Percentage of noise');
hold off
return 


    


        
        