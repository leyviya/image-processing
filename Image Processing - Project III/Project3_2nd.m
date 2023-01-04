image = imread('Moon.jpg');
image = rgb2gray(image);
fft_image = fft2(image);
fft_image = fftshift(fft_image);
magnitude = abs(fft_image);
imshow(magnitude, [])
[x, y] = ginput(2);
x = round(x);
y = round(y);
filter = ones(size(fft_image));
filter(y(1), x(1)) = 0;
filter(y(2), x(2)) = 0;
filter = ifftshift(filter);
filter = ifft2(filter);
filter = real(filter);
filtered_image = conv2(image, filter, 'same');
imshow(filtered_image, [])