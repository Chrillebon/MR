%% Header

% This function takes a fourier transformed picture and ads complex noise
% to the data in the shape of random intesity of "snow" covering 'tau' of
% the picture

%% Function
function im_noisy = addnoise(im_DFT, tau)

% Percent to range [0,1]
if tau > 1 && tau <= 100
    tau = tau / 100;
end

[m,n,o] = size(im_DFT); 
fronormRe=0;
fronormIm=0;
for u=1:o
    fronmormRe=fronormRe+norm(real(im_DFT(:,:,u)),'fro');
    fronormIm=fronormIm+norm(imag(im_DFT(:,:,u)),'fro')*i;
end
avfronormRe=fronormRe/o;
avfronormIm=fronormIm/o;


% for multiple layers
for u=1:o
    % mask is noiselevel
    IND = randperm(m*n,round(m*n*tau)); %randomly chooses tau*100 percent of pixels
    mask = zeros(m,n); %create m-by-n matrix of zeros
    mask(IND) = 1; %Set pixelvalue=1 where noise is to be added

    % r is picture of noise 
    r = randn(m,n); % Normal distributes noise on a 2D array
    r = r/norm(r,'fro'); %Every pixel scaled down by it's values' "size"

    % e is a picture of noise scaled with noiselevel 
    eRe = mask.*r*avfronormRe; 
    eIm = mask.*r*avfronormIm;
    % Inserting noise on picture
    im_noisy(:,:,u) = im_DFT(:,:,u) + eRe;
    im_noisy(:,:,u) = im_noisy(:,:,u) + eIm;
end

end