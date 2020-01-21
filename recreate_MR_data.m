%% Init

close all;
clear;
clc;

%% Loading needed data

load('A.mat');
load('B.mat');
load('head_ordered');
im = generate_simdata(256, 'C:\Users\chris\Desktop\Matlab\MR');

% own function for DFT transform and formatting data
dftIm = ft2(im);

% Adding noise and padding to own image
ourIm = addnoise(dftIm, 0.8);
ourIm = signal_limited(ourIm, 0.3);

%% Displaying single slices of data

disp_slice(im);
disp_slice(ourIm);
disp_slice(A, [], [], 140);

%% Recreating data

recA = ift2(A);
recB = ift2(B);
recHead = ift2(head_ordered);
recIm = ift2(ourIm);

%% Animations and displaying of 2D data

CreateGif(recHead, 'head');
CreateGif(recB, 'unknown');
disp_slice(recIm);

%% Full 3D models of data

% Creating and displaying the volume
vA = create_vol(recA);

% Figureing out size of volume from voxel size [mm]
[Volume, length, width, height] = vol_size(vA, 0.273438)

%% More visualization options

% Slicing through half of B
create_vol(B, [],1:size(b,2)/2,[]);

% Slicing through brain A
create_vol(A,[],[],1:140);