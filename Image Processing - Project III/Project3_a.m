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