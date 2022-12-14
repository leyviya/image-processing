clear;
clc;

image = imread('Im_1.jpg'); % original image
threshold_value = graythresh(image);
threshold_image = im2bw(image,threshold_value);

subplot(1,2,1),imshow('Im_1.PNG');
subplot(1,2,2), imshow(image);