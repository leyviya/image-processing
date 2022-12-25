clc;
close all;
a = im2double(imread('moon.tif')); %// Read in your image
lap = [-1 -1 -1; -1 8 -1; -1 -1 -1]; %// Change - Centre is now positive
resp = imfilter(a, lap, 'conv'); %// Change

%// Change - Normalize the response image
minR = min(resp(:));
maxR = max(resp(:));
resp = (resp - minR) / (maxR - minR);

%// Change - Adding to original image now
sharpened = a + resp;

%// Change - Normalize the sharpened result
minA = min(sharpened(:));
maxA = max(sharpened(:));
sharpened = (sharpened - minA) / (maxA - minA);

%// Change - Perform linear contrast enhancement
sharpened = imadjust(sharpened, [60/255 200/255], [0 1]);

figure; 
subplot(1,3,1);imshow(a); title('Original image');
subplot(1,3,2);imshow(resp); title('Laplacian filtered image');
subplot(1,3,3);imshow(sharpened); title('Sharpened image');