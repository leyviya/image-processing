% Load the corrupted image
img = imread('Moon.jpg');

% Apply 2D DFT to the image
f = fft2(img);

% Shift the zero-frequency component to the center of the spectrum
fshift = fftshift(f);

% Find the location of the periodic noise
[y, x] = find(fshift > 200);

% Create a notch filter by setting the value of the frequency spectrum at those locations to zero
fshift(y, x) = 0;

% Shift the zero-frequency component back to the original position
f_filtered = ifftshift(fshift);

% Apply inverse 2D DFT to obtain the filtered image
filtered_img = ifft2(f_filtered);

% Display the original and filtered images
subplot(1, 2, 1), imshow(img), title('Original Image');
subplot(1, 2, 2), imshow(filtered_img), title('Filtered Image');