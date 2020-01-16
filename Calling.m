%% Close all figures
close all;


%% Generate simulated data
simData = generate_simdata(256,'C:\Users\chris\MATLAB\Projects\MR');
figure;
imagesc(simData);
colormap('gray');
colorbar;


%% Padding

simPad = signal_limited(simData, 0.5);
figure;
imagesc(simPad);
colormap('gray');
colorbar;

%% Generate phantom image
phanton_im = phantom(256,256);
figure;
imagesc(phanton_im);
colorbar;

%% Fourier transforms image data
sim_fourier = fft2(simPad);
figure;
imagesc(log(abs(fftshift(sim_fourier))));
colorbar;

%% Adds noise to image data
im_noisy = addnoise(sim_fourier, 10);
figure;
imagesc(log(abs(fftshift(im_noisy))));
colorbar;

%% Invers Fourier transforms image data
inv_fourier = ifft2(im_noisy);
figure;
imagesc((abs(inv_fourier)));
colormap('gray');
colorbar;
