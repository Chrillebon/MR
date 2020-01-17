%% Close all figures
close all;
clear all;

%% Generate simulated data
simData = generate_simdata(256,'C:\Users\Marcu\MATLAB\Projects\untitled');
figure;
imagesc(simData);
colormap('gray');
colorbar;


%% Generate phantom image
phanton_im = phantom(256,256);
figure;
imagesc(phanton_im);
colorbar;

%% Fourier transforms image data
sim_fourier = fft2(simData);
figure;
imagesc(log(abs(fftshift(sim_fourier))));
colorbar;

%% Adds noise to image data
im_noisy = addnoise(sim_fourier, 10);
figure;
imagesc(log(abs(fftshift(im_noisy))));
colorbar;
%% Padding
signal_pad = signal_limited(fftshift(im_noisy), 0.2);
figure;
imagesc(log(abs(signal_pad)));
colorbar;

%% Invers Fourier transforms image data
inv_fourier = ifft2(ifftshift(signal_pad));
figure;
imagesc((abs(inv_fourier)));
colormap('gray');
colorbar;
%% Calculates error between image and reconstructed image
Error=error_measure(simData,inv_fourier);
disp(Error);
%% Graphs error at different paddings 
noise_array=[0.1:0.1:1];
pad_array=[0:0.1:1];
graph=graphing_error(noise_array,pad_array,simData);
