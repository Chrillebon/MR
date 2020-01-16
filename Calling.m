%% Close all figures
close all;

%% Generate simulated data
simData = generate_simdata(256,'C:\Users\aleks\OneDrive\Skole\DTU\1. Semester\Intro til MatTek\3 Ugers\MR Projekt');
figure;
imagesc(simData);
colorbar;

%% Generate phantom image
phanton_im = phantom(256,256);
figure;
imagesc(phanton_im);

%% Fourier transforms image data
sim_fourier = fft2(simData);
figure;
imagesc(log(abs(fftshift(sim_fourier))));

%% Adds noise to image data
im_noisy = addnoise(simData, 10);
figure;
imagesc(im_noisy);
colorbar;

%% Invers Fourier transforms image data
inv_fourier = ifft2(sim_fourier);
figure;
imagesc(log(abs(inv_fourier)));
