%% Close all figures
close all;
clear all;

%% Generate simulated data
simData = generate_simdata(256,'C:\Users\Marcu\MATLAB\Projects\untitled');
disp_slice(simData);


%% Generate phantom image
phanton_im = phantom(256,256);
disp_slice(phantom_im);

%% Fourier transforms image data
sim_fourier = ft2(simData);
disp_slice(sim_fourier);

%% Adds noise to image data
im_noisy = addnoise(sim_fourier, 40);
disp_slice(im_noisy);
%% Padding
signal_pad = signal_limited((im_noisy), 10);
disp_slice(signal_pad);


%% Invers Fourier transforms image data
inv_fourier = ift2(signal_pad);
disp_slice(inv_fourier);
%% Calculates error between image and reconstructed image
Error=error_measure(simData,inv_fourier);
disp(Error);

%% Graphs error at different paddings 
noise_array=[0:0.2:1];
pad_array=[0:0.01:1];    
graph=graphing_error(noise_array,pad_array,simData);
