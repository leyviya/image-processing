% Load image and convert to grayscale
I = rgb2gray(imread('Moon.jpg'));

% Calculate 2D FFT of image
S = fft2(I);

% Shift spectrum so that center is at (0,0)
S = fftshift(S);

% Find location of impulses in spectrum
[max_val, max_idx] = max(S(:));
[i, j] = ind2sub(size(S), max_idx);

% Create notch filter transfer function
filter = ones(size(S));
filter(i,j) = 0;
filter(size(S,1)-i+1,size(S,2)-j+1) = 0;

% Shift spectrum back so that center is at (0,0)
filter = ifftshift(filter);

% Multiply spectrum by notch filter transfer function
S_filtered = S .* filter;

% Invert filtered spectrum
I_filtered = ifft2(S_filtered);

% Display original and filtered images
figure;
subplot(1,2,1);
imshow(I);
title('Original Image');

subplot(1,2,2);
imshow(I_filtered);
title('Filtered Image');