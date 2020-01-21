%% Header

% This funtion is used to calculate the error between a known image and a
% recreation of that same image, like after a recreation through inverse
% DFT transformation. The 

%% Function
function Error=error_measure(known_image, recreated_image)

Error = norm( known_image - recreated_image, 'fro') / norm(known_image, 'fro');

end


