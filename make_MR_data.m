%% Init
close all;
clear;
clc;

%% Generate simulated data

% Figures without textures
sim_data = generate_simdata(256);
disp_slice(sim_data);

% Figures with textures
simTex_data = generate_simdata(256, '<Your Path to texfile goes here!>');
disp_slice(simTex_data);

% Phantom image
phan_data = generate_simdata(256, 'phantom');
disp_slice(phan_data);

%% Fourier transforms image data

sim_fourier = ft2(sim_data);
disp_slice(sim_fourier);

simTex_fourier = ft2(simTex_data);
disp_slice(simTex_fourier);

phan_fourier = ft2(phan_data);
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

%% Reconstruct

sim_rec = ift2(sim_pad);
disp_slice(sim_rec);

simTex_rec = ift2(simTex_pad);
disp_slice(simTex_rec);

phan_rec = ift2(phan_pad);
disp_slice(phan_rec);

%% Error graphing

graphing_error(0:0.2:1,0:0.1:1,sim_data);

graphing_error(0:0.1:1,0:0.2:1,simTex_data);

graphing_error(0:0.05:1,0:0.05:1,phan_data);