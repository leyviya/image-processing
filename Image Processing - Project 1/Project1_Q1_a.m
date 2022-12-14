clear;
clc;

I = imread('Im_1.PNG'); % original image
figure(1) % open the 2nd figure window

subplot(2,2,1)
imshow(I,[])
title('256 intensity levels')

subplot(2,2,2)
imshow(bitshift(I,-1),[])
title('128 intensity levels')

subplot(2,2,3)
imshow(bitshift(I,-2),[])
title('64 intensity levels')

subplot(2,2,4)
imshow(bitshift(I,-3),[])
title('32 intensity levels')

figure(2) % open the 1st figure window

subplot(2,2,1)
imshow(bitshift(I,-4),[])
title('16 intensity levels')

subplot(2,2,2)
imshow(bitshift(I,-5),[])
title('8 intensity levels')

subplot(2,2,3)
imshow(bitshift(I,-6),[])
title('4 intensity levels')

subplot(2,2,4)
imshow(bitshift(I,-7),[])
title('2 intensity levels')