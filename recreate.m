close all;
clear;
clc;

load('B.mat');

result = ifft2(B);

figure;
histogram(abs(result),100);

vol = B > 500;

figure;
isosurface(vol);