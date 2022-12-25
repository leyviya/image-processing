function highboost(k)
[f,p]=uigetfile('moon.tif', 'Select an image');

myImage=imread([p,f]);
% k = 8
Guassian = imgaussfilt(myImage);
diff = myImage-Guassian;
masked = myImage + (diff*k);

figure();
subplot(2,2,1);
imshow(myImage); 
title('Original Image');

subplot(2,2,2);
imshow(Guassian);
title('Blurred Image');

subplot(2,2,3);
imshow(diff); 
title('The Difference');

subplot(2,2,4);
imshow(masked); 
title(['Sharpened Image ', 'k = ', num2str(k)]);