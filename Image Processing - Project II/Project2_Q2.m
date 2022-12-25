img = imread('softstone.PNG');

% create gaussian filter
h = fspecial('gaussian',5,2.5);
% blur the image
blurred_img = imfilter(img,h);
% subtract blurred image from original
diff_img = img - blurred_img;
% add difference to the original image
highboost_img = img + 3*diff_img;

subplot 221
imshow(img,[]);
title('Original Image')

subplot 222
imshow(blurred_img,[]);
title('Blurred Image')

subplot 223
imshow(diff_img,[]);
title('Difference Image')

subplot 224
imshow(highboost_img,[]);
title('HighBoosted Image')