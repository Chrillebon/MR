%% Header

% This function takes a fourier transformed picture and ads complex noise
% to the data in the shape of random intesity of "snow" covering 'tau' of
% the picture in complex values

%% Function
function im_noisy = addnoise(im_DFT, tau)

% Percent to range [0,1]
if tau > 1 && tau <= 100
    tau = tau / 100;
end

[m,n,o] = size(im_DFT); 

% Variables for calculating average 'fro' norm
fronormRe=0;
fronormIm=0;
for u=1:o
    % Sum of all layers
    
    % Real part
    fronmormRe=fronormRe+norm(real(im_DFT(:,:,u)),'fro');
    % Imaginary part
    fronormIm=fronormIm+norm(imag(im_DFT(:,:,u)),'fro')*i;
end
% Divide by layers
avfronormRe=fronormRe/o;
avfronormIm=fronormIm/o;


% Adding noise to all layers
for u=1:o
    %randomly chooses tau*100 percent of pixels
    IND = randperm(m*n,round(m*n*tau)); 
    mask = zeros(m,n); 
    mask(IND) = 1;

    % Normal distributes noise on a 2D array
    r = randn(m,n); 
    % Scaled down by it's values' "size"
    r = r/norm(r,'fro'); 

    % Layer of noise to be added
    eRe = mask.*r*avfronormRe; 
    eIm = mask.*r*avfronormIm;
    
    % Inserting noise on picture
    im_noisy(:,:,u) = im_DFT(:,:,u) + eRe;
    im_noisy(:,:,u) = im_noisy(:,:,u) + eIm;
end

end