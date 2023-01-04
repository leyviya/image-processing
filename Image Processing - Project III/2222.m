% Load the image and convert it to grayscale
image = imread('Moon.jpg');
image = rgb2gray(image);

% Compute the 2D FFT of the image
fft_image = fft2(image);

% Shift the zero-frequency component to the center of the spectrum
fft_image = fftshift(fft_image);

% Compute the magnitude of the FFT
magnitude = abs(fft_image);

% Display the magnitude spectrum
imshow(magnitude, [])

% Manually select the locations of the impulses
[x, y] = ginput(2);
x = round(x);
y = round(y);

% Create a notch filter with notches at the locations of the impulses
filter = ones(size(fft_image));
filter(y(1), x(1)) = 0;
filter(y(2), x(2)) = 0;

% Unshift the zero-frequency component
filter = ifftshift(filter);

% Compute the inverse 2D FFT of the filter
filter = ifft2(filter);

% Obtain the real part of the filter
filter = real(filter);

% Convolve the image with the filter
filtered_image = conv2(image, filter, 'same');

% Display the filtered image
imshow(filtered_image, [])