%% Init
close all;
clear;
clc;

%% Generate simulated data

% Figures without textures
simData = generate_simdata(256);
disp_slice(simData);

% Figures with textures
simDataTex = generate_simdata(256, '<Your Path to texfile goes here!>');
disp_slice(simDataTex);

% Phantom image
phan = generate_simdata(256, 'phantom');
disp_slice(phan);

%% Fourier transforms image data

sim_fourier = ft2(simData);
disp_slice(sim_fourier);

simTex_fourier = ft2(simDataTex);
disp_slice(simTex_fourier);

phan_fourier = ft2(phan);
disp_slice(phan_fourier);

%% Adds noise to image data

sim_noise = addnoise(sim_fourier, 60);
disp_slice(sim_noise);

simTex_noise = addnoise(simTex_fourier, 60);
disp_slice(simTex_noise);

phan_noise = addnoise(phan_fourier, 60);
disp_slice(phan_noise);

%% Padding

sim_pad = signal_limited(sim_noise, 30);
disp_slice(sim_pad);

simTex_pad = signal_limited(simTex_noise, 30);
disp_slice(simTex_pad);

phan_pad = signal_limited(phan_noise, 30);
disp_slice(phan_pad);