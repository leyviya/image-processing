% Load the input image
img = imread('chest.jpg');

% Get the image dimensions
[rows, cols, channels] = size(img);

% Initialize the output image
%% 
centered_img = zeros(size(img));

% Multiply the input image by (-1)^(x+y) to center the transform for filtering
for x = 1:rows
    for y = 1:cols
        centered_img(x,y,:) = img(x,y,:) * (-1)^(x+y);
    end
end

% Create the filter function
filter_size = 5;
filter_func = ones(filter_size) / (filter_size^2);

% Multiply the resulting (complex) array by a real filter function
filtered_img = imfilter(centered_img, filter_func);

% Compute the discrete Fourier transform (DFT) of the filtered image
%% 
F = fft2(filtered_img);

% Shift the DFT so that the low frequency components are centered
F_shift = fftshift(F);

% Compute the magnitude and phase of the DFT
magnitude = abs(F_shift);
phase = angle(F_shift);

% Show the centred spectrum
imshow(magnitude, []);

% Compute the average value of the original image
avg_value = mean(img(:));

% Compute the inverse Fourier transform
inv_F = ifft2(F);

% Initialize the output image
out_img = zeros(size(inv_F));

% Multiply the result by (-1)^(x+y) and take the real part
for x = 1:rows
    for y = 1:cols
        out_img(x,y,:) = real(inv_F(x,y,:) * (-1)^(x+y));
    end
end

% Display the resulting enhanced image
imshow(out_img);
