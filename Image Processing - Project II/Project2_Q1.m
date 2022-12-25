clc

clear all

close all

a=imread('Phoenix.PNG');

b=rgb2gray(a);

subplot(2,2,1);

imshow(b);

title('Original Grayscale Image');

subplot(2,2,3);

imhist(b);

title('Histogram of Original Grayscale Image');

j=histeq(b);

subplot(2,2,2);

imshow(j);

title('Image after histogram equalization');

subplot(2,2,4);

imhist(j);

title('Histogram of image after histogram equalization');

