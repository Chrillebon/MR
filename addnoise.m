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

% for multiple layers
for i=1:o
    % Where noise is to be added
    IND = randperm(m*n,round(m*n*tau));
    mask = zeros(m,n);
    mask(IND) = 1;

    % noise that can be added, if IND(i,o) == 1
    r = randn(m,n); r = r/norm(r,'fro');

    % Layer of wanted noise
    e = mask.*r*norm(im_DFT(:,:,i),'fro');

    % Inserting noise
    im_noisy(:,:,i) = im_DFT(:,:,i) + e;
end

end