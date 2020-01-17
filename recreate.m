%% Close all figures, clear variables and command window
close all;
clear;
clc;

%% Load data and create histogram
filename = 'head_ordered.mat';
load(filename);

result = ifft2(head_ordered);

figure;
histogram(abs(result),100);

%% Generate GIF of 2D plot slices
CreateGif(head_ordered, 'head_ordered');

%% 3d plot of data besides black data
vol = B < 500;

[m, n, k] = size(B);

x = [];
y = [];
z = [];

for i = 1:m
    for j = 1:n
        for o = 1:k
            x = [x, n];
            y = [y, m];
            z = [z, o];
        end
    end
end

figure;
